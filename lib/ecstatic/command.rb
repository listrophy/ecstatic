module Ecstatic
  class Command < Thor
    include Thor::Actions
    include Ecstatic::Actions

    def self.source_root
      File.expand_path('../templates', __FILE__)
    end

    desc 'init', 'Create a new ecstatic project'
    method_options ghpages: false, aliases: '-gh', banner: "test"
    def init
      init_git_if_not_already
      directory 'site'
      copy_file '.gitignore'

      if options.ghpages?
        empty_directory 'gh-pages'
        init_git_if_not_already('gh-pages')
        Dir.chdir('gh-pages') do
          git :checkout => '-b gh-pages'
        end
      end
    end

    desc 'server', 'Run your site locally, recompiling files as they change.'
    def server
      Thread.new do
        Ecstatic::Watcher.watch!
      end
      Ecstatic::Server.run!
    end

    private
    def init_git_if_not_already(path = '.')
      unless Dir.exists?(File.join(path, '.git'))
        git :init => path
      else
        puts "Skipping git init because #{path} already has a .git/"
      end
    end
  end
end

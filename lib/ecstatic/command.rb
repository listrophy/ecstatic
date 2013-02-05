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

    desc 'deploy', 'Deploy a site to Github Pages.'
    def deploy
      Dir.chdir('gh-pages') do
        ensure_we_are_on_branch
        commit_changes_if_necessary &&
          push_changes
      end
    end

    private
    def init_git_if_not_already(path = '.')
      unless Dir.exists?(File.join(path, '.git'))
        git :init => path
      else
        puts "Skipping git init because #{path} already has a .git/"
      end
    end

    def ensure_we_are_on_branch
      current_branch = `git rev-parse --abbrev-ref HEAD`

      unless current_branch.chomp == 'gh-pages'
        git :checkout => 'gh-pages'
      end
    end

    def commit_changes_if_necessary
      unless `git status -s`.chomp.empty?
        git :add => '-A .'
        git :commit => %Q(-m "Deploy at #{DateTime.now.rfc2822}")
      else
        puts "Nothing to deploy."
        return false
      end
    end

    def push_changes
      git :push => '-u origin gh-pages'
    end
  end
end

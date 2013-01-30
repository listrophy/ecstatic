module Ecstatic
  class Command < Thor
    include Thor::Actions
    include Ecstatic::Actions

    def self.source_root
      File.expand_path("../templates", __FILE__)
    end

    desc "init", "Create a new ecstatic project"
    def init
      git :init
      directory 'site'
      copy_file '.gitignore'
    end

    desc "server", "Run your site locally, recompiling files as they change."
    def server
      Ecstatic::Server.run!
    end
  end
end

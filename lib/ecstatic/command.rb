module Ecstatic
  class Command < Thor
    include Thor::Actions

    def self.source_root
      File.expand_path("../templates", __FILE__)
    end

    desc "init", "Create a new ecstatic project"
    def init
      directory 'site'
      
    end
  end
end

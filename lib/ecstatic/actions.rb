module Ecstatic
  module Actions
    # Run a command in git.
    #
    #   git :init
    #   git add: "this.file that.rb"
    #   git add: "onefile.rb", rm: "badfile.cxx"
    def git(commands={})
      if commands.is_a?(Symbol)
        run "git #{commands}"
      else
        commands.each do |cmd, options|
          run "git #{cmd} #{options}"
        end
      end
    end
  end
end

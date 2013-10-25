require 'watchr'

module Ecstatic
  class Watcher
    def self.watch!
      script = Watchr::Script.new
      script.watch('site/pages/(.*)\.haml') do |m|
        puts "Compiling page: #{m[0]}"
        system("haml site/pages/#{m[1]}.haml gh-pages/#{m[1]}")
      end

      script.watch('site/assets/stylesheets/.*') { puts 'Compiling scss'; system('compass compile') }
      handler = Watchr.handler.new;
      controller = Watchr::Controller.new(script,handler);
      controller.run # blocking
    end
  end
end

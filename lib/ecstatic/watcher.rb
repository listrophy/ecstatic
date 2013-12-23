require 'watchr'

module Ecstatic
  class Watcher
    def self.watch!
      script = Watchr::Script.new

      # haml
      script.watch('site/pages/(.*)\.haml') do |m|
        puts "Compiling page: #{m[0]}"
        system("haml site/pages/#{m[1]}.haml gh-pages/#{m[1]}.html")
      end

      # scss
      script.watch('site/assets/stylesheets/.*') { puts 'Compiling scss'; system('compass compile') }

      # coffeescript
      script.watch('site/scripts/(.*)\.coffee') do |m|
        puts "Compiling CoffeeScript file: #{m[0]}"
        system("coffee -o gh-pages/javascripts -c site/scripts/#{m[1]}.coffee")
      end

      # javascript
      script.watch('site/scripts/(.*)\.js') do |m|
        puts "Copying changed JavaScript: #{m[0]}"
        system("cp #{m[0]} gh-pages/javascripts/#{m[1]}.js")
      end

      handler = Watchr.handler.new

      controller = Watchr::Controller.new(script,handler)
      controller.run # blocking
    end
  end
end

require 'watchr'

module Ecstatic
  class Watcher
    def self.watch!
      script = Watchr::Script.new
      script.watch('site/.*') { |m| puts "I would have compiled #{m[0]}" }
      handler = Watchr.handler.new;
      controller = Watchr::Controller.new(script,handler);
      controller.run # blocking
    end
  end
end

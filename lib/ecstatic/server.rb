require 'sinatra'

module Ecstatic
  class Server < Sinatra::Base
    configure do
      set :public_folder, 'gh-pages'
    end

    get '/' do
      open 'gh-pages/index.html'
    end
  end
end

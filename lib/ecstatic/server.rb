require 'sinatra'

module Ecstatic
  class Server < Sinatra::Base
    get '/' do
      open 'index.html'
    end
  end
end

set :public_folder, File.dirname(__FILE__)

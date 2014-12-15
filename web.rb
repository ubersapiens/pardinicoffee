require 'sinatra/base'
require 'pony'

class Web < Sinatra::Base

  configure do
    set :public_folder, 'public'
  end

  get "/" do
    redirect '/index.html'
  end
end
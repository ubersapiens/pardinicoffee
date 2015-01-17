require 'rubygems'
require 'sinatra/base'
require 'pony'

class Web < Sinatra::Base

  configure do
    set :public_folder, 'public'
  end

  get "/" do
    redirect '/index.html'
  end

  post "/shop.html" do
    require 'pony'
    Pony.mail(
      :to => 'juan@pardini.coffee', 
      :from => params[:name],
      :subject => 'test', 
      :body => "test", 
      :via => :smtp, 
      :via_options => {
          :address     => 'localhost',
          :port     => '25',
        }
    )
  end
end
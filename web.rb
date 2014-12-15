require 'sinatra/base'
require 'pony'

class Web < Sinatra::Base

  configure do
    set :public_folder, 'public'
  end

  get "/" do
    redirect '/index.html'
  end

  post '/shop.html' do
    Pony.mail({
    :from => params[:name],
    :to => 'ubersapiens@gmail.com',
    :subject => params[:name] + " " + "has contacted you via the Pardini Coffee Co.",
    :body => params[:mail],
    :via => :smtp,
    :via_options => {
     :address              => 'smtp.gmail.com',
     :port                 => '587',
     :enable_starttls_auto => true,
     :user_name            => 'ubersapiens@gmail.com',
     :password             => 'Jfp160885',
     :authentication       => :plain, 
     :domain               => "pardinicoffee.herokuapp.com" 
     } 
    })  
  end
end
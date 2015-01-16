require 'rubygems'
require 'sinatra/base'
require 'pony'
require 'net/smtp'

class Web < Sinatra::Base

  configure do
    set :public_folder, 'public'
  end

  get '/' do
    redirect '/index.html'
  end


  post '/shop.html' do 
    require 'pony'
    Pony.mail(
      :from => params[:email],
      :to => 'pardinicoffee@gmail.com',
      :subject => "RE: Coffee needed by " + params[:name],
      :body => params[:name] + " liked the following coffee: " + params[:coffee] + ". And would like " + params[:bags] + " bags delivered to them.",
      :via => :smtp,
      :via_options => { 
        :address              => 'smtp.gmail.com',
        :port           => '587',
        :enable_starttls_auto => true, 
        :user_name => ENV['GMAIL_USERNAME'],
        :password => ENV['GMAIL_PASSWORD'],
        :authentication       => :plain, 
        :domain               => 'localhost.localdomain'
      })
    redirect '/thankyou.html' 
  end
end
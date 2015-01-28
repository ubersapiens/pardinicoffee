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
      :from => params[:email_address],
      :to => 'pardinicoffee@gmail.com',
      :subject => 'RE: Coffee needed by ' + params[:name],
      :body => 'A bag of amazing coffee has been ordered by ' + params[:email_address] + '. Add the client\'s information to Pardini Co. sales sheet. And get ready to make some awesome coffee!',
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
    redirect '/index.html' 
  end

  post '/french/shop.html' do 
    require 'pony'
    Pony.mail(
      :from => params[:email_address],
      :to => 'pardinicoffee@gmail.com',
      :subject => 'RE: Coffee needed by ' + params[:name],
      :body => 'A bag of amazing coffee has been ordered by ' + params[:email_address] + '. Add the client\'s information to Pardini Co. sales sheet. And get ready to make some awesome coffee!',
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
    redirect '/index.html' 
  end
end
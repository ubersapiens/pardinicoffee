require 'sinatra/base'

class Web < Sinatra::Base

configure do

  set :public_folder, 'public'

end

# route to starting page
get "/" do
  redirect '/index.html'
end

end
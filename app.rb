require 'sinatra/base'

class Makersbnb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/listings' do
    erb :viewing_listings
  end

  get '/add_listing' do

  end

  run! if app_file == $0
end

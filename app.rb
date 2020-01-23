require 'sinatra'
require './lib/listings'

class Makersbnb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/listings' do
    @listings = Viewlist.all
    erb :viewing_listings
  end

  get '/add_listing' do
    erb :add_listing
  end

  post '/' do
    Add_listing.add(params[:place_name], params[:ppn], params[:guests], params[:description])
    redirect('/')
  end

  run! if app_file == $0
end

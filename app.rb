require 'sinatra'
require './lib/listings'

class Makersbnb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/listings' do
    @listings = Listings.all
    erb :viewing_listings
  end

  get '/add_listing' do
    erb :add_listing
  end

  post '/' do
    Listings.add(params[:place_name], params[:ppn], params[:guests], params[:description])
    redirect('/')
  end

  post '/book_now' do
    $place = (params[:booking])
    redirect('/book_now')
  end

  get '/book_now' do
    @place = $place
    p @place
    erb :booking
  end



  run! if app_file == $0
end

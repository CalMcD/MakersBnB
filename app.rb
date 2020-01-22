require 'sinatra'
require './lib/add_listing'

class Makersbnb < Sinatra::Base

  get '/' do
    'Home page'
  end

#  get '/listings' do

#  end

  get '/add_listing' do
    erb :add_listing
  end

  post '/' do
    Add_listing.add(params[:place_name], params[:ppn], params[:guests], params[:description])
    redirect('/')
  end

end

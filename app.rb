require 'sinatra'
require './lib/listings'
require './lib/booking'

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
    @info = Booking.query(@place)
    p @info
    $ppn = @info.getvalue(0,3)
    erb :booking
  end

  post '/confirm_booking' do
    $start_date = (params[:start_date])
    $nights = (params[:nights])
    redirect('/confirm_booking')
  end

  get '/confirm_booking' do
    @place = $place
    @nights = $nights
    @start_date = $start_date
    @ppn = $ppn
    erb :confirm_booking
  end

  get '/confirmed' do
    @place = $place
    @nights = $nights
    @start_date = $start_date
    Booking.add($place, $start_date, $nights)
    erb:confirmed
  end
  run! if app_file == $0
end

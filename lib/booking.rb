require 'pg'

class Booking

  def self.query(place_name)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("SELECT * FROM listings WHERE place_name='#{place_name}'")
  end

  def self.existing_bookings(place_name)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("SELECT * FROM bookings WHERE place_name='#{place_name}'")
  end

  def self.add(place_name, start_date, nights)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    ppn = connection.exec("SELECT ppn FROM listings WHERE place_name='#{place_name}'")
    p start_date
    p nights
    ppn = ppn.getvalue(0,0)
    result = connection.exec("INSERT INTO bookings(place_name, start_date, nights) VALUES ('#{place_name}', '#{start_date}', '#{nights}')")
  end


  end

require 'pg'

class Booking

  def self.query(place_name)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("SELECT * FROM listings WHERE place_name='#{place_name}';")
  end

  def self.add(place_name, start_date, nights, ppn)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO requests(place_name, start_date, nights, ppn) VALUES ('#{place_name}', '#{start_date}', '#{nights}', #{ppn});")
  end

  def self.requests
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM requests;")
  end

  def self.confirm(booking)
    p booking
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("INSERT INTO bookings(place_name, nights, ppn, start_date) SELECT place_name, nights, ppn, start_date FROM requests WHERE id='#{booking.to_i}';")
    connection.exec("DELETE FROM requests WHERE id='#{booking.to_i}';")
  end


  end

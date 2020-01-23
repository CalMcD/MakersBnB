require 'pg'

class Listings
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM listings;")
  end

  def self.add(place_name, ppn, guests, description)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
      connection.exec("INSERT INTO listings (place_name, ppn, guests, description) VALUES('#{place_name}', '#{ppn}', '#{guests}', '#{description}')")
    end

end

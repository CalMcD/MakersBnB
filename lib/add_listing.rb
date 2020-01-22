require 'pg'

class Add_listing

  def self.add(place_name, ppn, guests, description)
    
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("INSERT INTO listings (place_name, ppn, guests, description) VALUES('#{place_name}', '#{ppn}', '#{guests}', '#{description}')")
  end

end

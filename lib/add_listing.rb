require 'pg'

class Add_listing

  def self.add(place_name, ppn, guests, description)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO listings (place_name, ppn, guests, description) VALUES('#{place_name}', '#{ppn}', '#{guests}', '#{description}')")
  end

end

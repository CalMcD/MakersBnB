require 'pg'

class Viewlist
  def self.all
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("SELECT * FROM listings;")
    result.map 
  end
end

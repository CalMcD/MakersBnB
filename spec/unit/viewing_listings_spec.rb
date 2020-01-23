require 'listings'

describe Listings do
  describe '.all' do
    it 'returns all listings' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO listings (place_name, ppn, guests, description) VALUES('Nice Villa', '8', '10', 'Its nice');")

      # listings = Listings.add("Nice Villa", "8", "10", "Its nice")

      listings = Listings.all

      expect(listings.getvalue(0,2)).to include("Nice Villa")
      expect(listings.getvalue(0,3)).to include('8')
      expect(listings.getvalue(0,4)).to include('10')
      expect(listings.getvalue(0,5)).to include('Its nice')
      end
  end
end

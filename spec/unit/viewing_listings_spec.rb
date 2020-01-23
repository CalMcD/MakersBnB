require 'listings'

describe Listings do
  describe '.all' do
    it 'returns all listings' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO listings VALUES('Nice Villa', '8', '10', 'Its nice');")

      # listings = Listings.add("Nice Villa", "8", "10", "Its nice")

      listings = Listings.all

      expect(listings).to include('Nice Villa')
      expect(listings).to include('8')
      expect(listings).to include('10')
      expect(listings).to include('Its nice')
      end
  end
end

describe Listings do

  it 'should add the new listing to the database' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO listings (place_name, ppn, guests, description) VALUES('A really nice house', '200', '5', 'This house is nice');")

    listings = Listings.all

    expect(listings.getvalue(0,2)).to include "A really nice house"
    expect(listings.getvalue(0,3)).to include "200"
    expect(listings.getvalue(0,4)).to include "5"
    expect(listings.getvalue(0,5)).to include "This house is nice"
  end
end

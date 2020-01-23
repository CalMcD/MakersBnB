describe Viewlist do

  it 'should add the new listing to the database' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO listings (place_name, ppn, guests, description) VALUES('A really nice house', '200', '5', 'This house is nice')")

    listings = Viewlist.all

    expect(listings).to include "a really nice house"
    expect(listings).to include "200"
    expect(listings).to include "5"
    expect(listings).to include "This house is nice"
  end

end

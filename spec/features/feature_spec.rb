feature 'adding a new listing' do

  scenario 'user should be able to add a new listing and see it on the viewings page' do
    connection = PG.connect(dbname: 'makersbnb_test')
    visit('/')
    click_button('Create Listing')
    fill_in 'place_name', with: 'A really nice house'
    fill_in 'ppn', with: '200'
    fill_in 'guests', with: '5'
    fill_in 'description', with: 'This house is up for rent for 1 night only you do not want to miss out!'
    click_button('Submit new listing now')
    click_button('View Listings')
    expect(page).to have_content 'A really nice house'
  end

end

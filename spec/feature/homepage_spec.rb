feature 'viewing the index page' do
  scenario 'user can view homepage' do
    visit '/'
    expect(page).to have_content "Makersbnb"
  end

  scenario 'user can view listings' do
    visit '/'
    click_button "View Listings"
    expect(page).to have_content "Available Places"
  end

  scenario 'user can create listings' do
    visit '/'
    click_button "Create Listing"
  end
end

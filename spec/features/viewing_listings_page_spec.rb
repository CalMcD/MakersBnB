feature 'viewing the listings' do
  scenario 'user can view listings' do
    visit '/listings'
    expect(page).to have_content "Available Places"
  end
end

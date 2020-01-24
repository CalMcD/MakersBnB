feature 'registration' do
  scenario 'a user can sign up' do
    visit '/signup'
    fill_in('username', with: 'testuser')
    fill_in('password', with: 'testpassword')
    click_button('Sign Up')

    expect(page).to have_content "Welcome, testuser"
  end
end

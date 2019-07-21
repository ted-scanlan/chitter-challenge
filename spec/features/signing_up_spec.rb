feature 'signing up' do
scenario 'user has the option to sign up' do
    visit '/'
    click_button 'Sign up'
    fill_in 'name', with: 'Ted S'
    fill_in 'email', with: 'ted.scanlan@yahoo.com'
    fill_in 'username', with: 'teddy_S'
    fill_in 'password', with: 'coolbeans'
    click_button 'Submit'
    expect(page).to have_content "Congratulations, you have signed up!"
end
end

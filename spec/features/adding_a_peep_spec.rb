feature 'adding bookmarks' do
  scenario 'user can add a bookmark' do
    visit '/'
    fill_in 'peep_input', with: 'I love eggs'
    click_button 'Post'
    expect(page).to have_content "I love eggs"


  end
end

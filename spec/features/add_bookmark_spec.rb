feature 'add a bookmark' do
  scenario 'user can save a bookmark' do
    visit('/add_bookmark')
    fill_in('title', :with => "Google")
    fill_in('url', :with => "http://www.google.com")
    click_button('Save')
    expect(page).to have_link("Google", href: "http://www.google.com")
  end
end

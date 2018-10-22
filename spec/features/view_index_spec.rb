feature 'view index page' do
  scenario 'shows the index page when the app loads' do
    visit '/'
    expect(page).to have_content('Hello world')
  end
end

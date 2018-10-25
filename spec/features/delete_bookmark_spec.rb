require 'launchy'

feature 'delete bookmark,' do
  scenario 'user can delete a bookmark' do
    con = PG.connect :dbname => 'bookmark_manager_test'
    Bookmark.create('http://www.twitter.com', 'Twitter')
    visit("/bookmarks")
    expect(page).to have_content("Twitter")
    click_button("Delete")
    expect(page).to_not have_content("Twitter")
  end
end

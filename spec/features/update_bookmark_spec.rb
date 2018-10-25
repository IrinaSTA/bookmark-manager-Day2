# require 'launchy'
#
# feature 'update bookmark,' do
#   scenario 'user can update a bookmark url or title' do
#     con = PG.connect :dbname => 'bookmark_manager_test'
#     Bookmark.create('www.twitter.com', 'Twiter')
#     visit("/bookmarks")
#     expect(page).to have_content("Twiter")
#     click_button('Update')
#     fill_in('title', :with => "Twitter")
#     fill_in('url', with => 'http://www.twitter.com')
#     click_button('Save')
#     expect(page).to have_content("Twitter")
#     expect(page).to_not have_content("Twiter")
#   end
# end

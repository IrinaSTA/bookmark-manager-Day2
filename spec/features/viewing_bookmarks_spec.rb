
feature 'Viewing bookmarks' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'
      expect(page).to have_content 'Bookmark Manager'
    end
  end

  feature 'viewing bookmarks' do
    scenario 'bookmarks are visible' do
      add_bookmarks
      visit '/bookmarks'
      expect(page).to have_content 'Makers'
      expect(page).to have_content 'Software'
      expect(page).to have_content 'Google'
    end
  end
end

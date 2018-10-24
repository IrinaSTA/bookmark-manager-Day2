require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      add_bookmarks
      bookmarks = Bookmark.all
      expect(bookmarks[0].url).to eq("http://www.makersacademy.com")
      expect(bookmarks[1].url).to include("http://www.destroyallsoftware.com")
      expect(bookmarks[2].url).to include("http://www.google.com")
    end
  end
end

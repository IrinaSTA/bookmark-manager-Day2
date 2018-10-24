require 'pg'
require 'bookmark'

def add_bookmarks
  con = PG.connect :dbname => 'bookmark_manager_test'
  Bookmark.create('http://www.makersacademy.com', 'Makers')
  Bookmark.create('http://www.destroyallsoftware.com', 'Software')
  Bookmark.create('http://www.google.com', 'Google')
end

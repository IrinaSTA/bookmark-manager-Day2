require 'pg'

def add_bookmarks
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec "INSERT INTO bookmarks(url) VALUES('http://www.makersacademy.com');"
  con.exec "INSERT INTO bookmarks(url) VALUES('http://www.destroyallsoftware.com');"
  con.exec "INSERT INTO bookmarks(url) VALUES('http://www.google.com');"
end

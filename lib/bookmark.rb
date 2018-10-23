require 'pg'

class Bookmark
  def self.all
    con = PG.connect :dbname => 'bookmarks', :user => 'toddlangford-archer'
    results = con.exec "SELECT * FROM bookmarks;"
    results.map { |bookmark| bookmark['url'] }
  end
end

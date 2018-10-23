require 'pg'

class Bookmark
  def self.all
    database = ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    con = PG.connect :dbname => database
    results = con.exec "SELECT * FROM bookmarks;"
    results.map { |bookmark| bookmark['url'] }
  end
end

require 'pg'

class Bookmark

  def initialize(url)
    @url = url
  end

  def self.all
    db_connect
    results = @con.exec "SELECT * FROM bookmarks;"
    results.map { |bookmark| bookmark['url'] }
  end

  def self.create(url)
    db_connect
    @con.exec "INSERT INTO bookmarks (url) VALUES('#{url}');"
    Bookmark.new(url)
  end

  def self.db_connect
    database = ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    @con = PG.connect :dbname => database
  end


end

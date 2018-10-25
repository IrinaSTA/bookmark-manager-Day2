require 'pg'

class Bookmark

  attr_reader :url, :title, :id

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    conn = db_connect
    results = conn.exec "SELECT * FROM bookmarks;"
    results.map { |b| Bookmark.new(b['id'], b['url'], b['title']) }
  end

  def self.create(url, title)
    conn = db_connect
    rs = (conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;"))[0]
    Bookmark.new(rs['id'], rs['url'], rs['title'])
  end

  def self.find_by_id(id)
    conn = db_connect
    rs = conn.exec("SELECT * FROM bookmarks WHERE id = #{id};")[0]
    Bookmark.new(rs['id'], rs['url'], rs['title'])
  end

  def self.delete(bookmark)
    conn = db_connect
    conn.exec("DELETE FROM Bookmarks WHERE id = #{bookmark.id}")
  end

  def self.db_connect
    database = ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    PG.connect :dbname => database
  end


end

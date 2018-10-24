require 'pg'

class Bookmark

  attr_reader :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    db_connect
    results = @con.exec "SELECT * FROM bookmarks;"
    results.map { |b| Bookmark.new(b['id'], b['url'], b['title']) }
  end

  def self.create(url, title)
    db_connect
    rs = (@con.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;"))[0]
    Bookmark.new(rs['id'], rs['url'], rs['title'])
  end

  def self.db_connect
    database = ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    @con = PG.connect :dbname => database
  end


end

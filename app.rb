require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/add_bookmark' do
    erb(:add_bookmark)
  end

  post '/add_new' do
    Bookmark.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id/delete' do
    @bookmark = Bookmark.find_by_id(params[:id])
    Bookmark.delete(@bookmark)
    redirect('/bookmarks')
  end

  run! if app_file == $0
end

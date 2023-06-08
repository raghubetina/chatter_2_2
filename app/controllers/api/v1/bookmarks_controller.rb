class Api::V1::BookmarksController < Api::V1::GraphitiController
  def index
    bookmarks = BookmarkResource.all(params)
    respond_with(bookmarks)
  end

  def show
    bookmark = BookmarkResource.find(params)
    respond_with(bookmark)
  end

  def create
    bookmark = BookmarkResource.build(params)

    if bookmark.save
      render jsonapi: bookmark, status: 201
    else
      render jsonapi_errors: bookmark
    end
  end

  def update
    bookmark = BookmarkResource.find(params)

    if bookmark.update_attributes
      render jsonapi: bookmark
    else
      render jsonapi_errors: bookmark
    end
  end

  def destroy
    bookmark = BookmarkResource.find(params)

    if bookmark.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: bookmark
    end
  end
end

class BookmarksController < ApplicationController
  before_action :current_user_must_be_bookmark_bookmarker,
                only: %i[edit update destroy]

  before_action :set_bookmark, only: %i[show edit update destroy]

  def index
    @q = current_user.bookmarks.ransack(params[:q])
    @bookmarks = @q.result(distinct: true).includes(:bookmarker,
                                                    :post).page(params[:page]).per(10)
  end

  def show; end

  def new
    @bookmark = Bookmark.new
  end

  def edit; end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      message = "Bookmark was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @bookmark, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: "Bookmark was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @bookmark.destroy
    message = "Bookmark was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to bookmarks_url, notice: message
    end
  end

  private

  def current_user_must_be_bookmark_bookmarker
    set_bookmark
    unless current_user == @bookmark.bookmarker
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:bookmarker_id, :post_id)
  end
end

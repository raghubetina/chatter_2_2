class PostsController < ApplicationController
  before_action :current_user_must_be_post_author,
                only: %i[edit update destroy]

  before_action :set_post, only: %i[show edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:author, :comments, :likes,
                                                :bookmarks, :commenters_followers, :bookmarkers_followers, :fans_followers, :author_followers, :bookmarkers, :fans, :commenters).page(params[:page]).per(10)
  end

  def show
    @bookmark = Bookmark.new
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)

    if @post.save
      message = "Post was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @post, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    message = "Post was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to posts_url, notice: message
    end
  end

  private

  def current_user_must_be_post_author
    set_post
    unless current_user == @post.author
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :author_id)
  end
end

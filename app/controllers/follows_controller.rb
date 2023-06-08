class FollowsController < ApplicationController
  before_action :current_user_must_be_follow_follower,
                only: %i[edit update destroy]

  before_action :set_follow, only: %i[show edit update destroy]

  def index
    @q = current_user.follows_as_follower.ransack(params[:q])
    @follows = @q.result(distinct: true).includes(:leader,
                                                  :follower).page(params[:page]).per(10)
  end

  def show; end

  def new
    @follow = Follow.new
  end

  def edit; end

  def create
    @follow = Follow.new(follow_params)

    if @follow.save
      message = "Follow was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @follow, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @follow.update(follow_params)
      redirect_to @follow, notice: "Follow was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @follow.destroy
    message = "Follow was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to follows_url, notice: message
    end
  end

  private

  def current_user_must_be_follow_follower
    set_follow
    unless current_user == @follow.follower
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_follow
    @follow = Follow.find(params[:id])
  end

  def follow_params
    params.require(:follow).permit(:leader_id, :follower_id)
  end
end

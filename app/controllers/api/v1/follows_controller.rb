class Api::V1::FollowsController < Api::V1::GraphitiController
  def index
    follows = FollowResource.all(params)
    respond_with(follows)
  end

  def show
    follow = FollowResource.find(params)
    respond_with(follow)
  end

  def create
    follow = FollowResource.build(params)

    if follow.save
      render jsonapi: follow, status: :created
    else
      render jsonapi_errors: follow
    end
  end

  def update
    follow = FollowResource.find(params)

    if follow.update_attributes
      render jsonapi: follow
    else
      render jsonapi_errors: follow
    end
  end

  def destroy
    follow = FollowResource.find(params)

    if follow.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: follow
    end
  end
end

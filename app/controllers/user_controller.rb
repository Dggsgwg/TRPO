class UserController < ApplicationController
  def index
    @travels = Travel.where(user_id: current_user.id)
    # render json: @travels
  end
end

class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    @travels = Travel.where(user_id: current_user.id)
    # render json: @travels
  end
end

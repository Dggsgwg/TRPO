class HomeController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery prepend: true

  def index
    if user_signed_in?
      render json:{msg: "Основная страница"}
    else
      redirect_to root_path
    end
  end

end

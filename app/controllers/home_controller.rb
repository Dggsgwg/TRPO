class HomeController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery prepend: true
  def index
    redirect_to :travels
  end

end

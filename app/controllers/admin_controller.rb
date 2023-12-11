class AdminController < ApplicationController
  def index
    @travels = Travel.all.sort
    begin
      authorize Travel, policy_class: AdminPolicy
    rescue Pundit::NotAuthorizedError
      redirect_to :not_admin
      return
    end
  end

  def chipi

  end
end

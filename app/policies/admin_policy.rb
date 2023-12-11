class AdminPolicy < ApplicationPolicy
  attr_reader :user, :travel

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.admin
  end
end

class TravelPolicy < ApplicationPolicy
  attr_reader :user, :travel

  def initialize(user, record)
    @user = user
    @record = record
  end

  def update?
    @user.travels.where(id: @record.id).first.present? || @user.admin?
  end

  def destroy?
    @user.travels.where(id: @record.id).first.present? || @user.admin?
  end

  def approve?
    @user.admin
  end

  def disapprove?
    @user.admin
  end
end

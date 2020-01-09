class RentPolicy < ApplicationPolicy
  def create?
    user.present?
  end
end

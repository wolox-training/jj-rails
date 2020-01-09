class RentPolicy < ApplicationPolicy
  def show?
    user == record.user
  end
end

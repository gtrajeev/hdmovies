class MoviePolicy < ApplicationPolicy
  def update?
    user && user.admin?
  end
  def create?
    user && user.admin?
  end
  def destroy?
    user && user.admin?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end

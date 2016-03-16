class TaskPolicy < ApplicationPolicy
  def show?
    update?
  end

  def create?
    user.has_role? :customer
  end

  def update?
    user.has_role? :developer || record.user == user
  end

  class Scope < Scope
    def resolve
      if user.has_role? :developer
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def permitted_attributes
    if user.has_role? :developer
      [:title, :description, :status]
    else
      [:title, :description]
    end
  end
end

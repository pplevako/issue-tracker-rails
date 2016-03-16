class TaskPolicy < ApplicationPolicy
  def create?
    user.has_role? :customer
  end

  def update?
    user.has_role? :developer || record.user == user
  end

  def permitted_attributes
    if user.has_role? :developer
      [:title, :description, :status]
    else
      [:title, :description]
    end
  end
end

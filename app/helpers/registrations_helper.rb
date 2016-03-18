module RegistrationsHelper
  def user_roles(user)
    user.roles.map { |role| role.name }
  end
end

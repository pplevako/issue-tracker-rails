class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # TODO: maybe rename to owned_tasks
  has_many :tasks

  def add_regular_role(role)
    if Role.regular_roles.include?(role)
      add_role role
    else
      add_role :customer
    end
  end
end

class RegistrationsController < Devise::RegistrationsController
  after_action :add_role, only: :create

  private

  def add_role
    @user.add_regular_role(params[:user][:role])
  end
end

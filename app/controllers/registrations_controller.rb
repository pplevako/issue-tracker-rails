class RegistrationsController < Devise::RegistrationsController
  def create
    super do
      # TODO: wrap this in transaction along with user creation?
      @user.add_regular_role(params[:user][:role]) if @user.persisted?
    end
  end
end

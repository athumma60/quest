class RegistrationsController < Devise::RegistrationsController

  private
  #Defines parameters for updating a users registration
  def account_update_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :lastanswer1, :lastanswer2, :lastanswer3, :lastanswer4, :lastanswer5, :name)
  end

end
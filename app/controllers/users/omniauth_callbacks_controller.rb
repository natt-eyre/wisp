class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def vkontakte
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      @user.token = request.env["omniauth.auth"].credentials.token
      @user.save!
      set_flash_message(:notice, :success, :kind => "vkontakte") if is_navigational_format?
    else
      session["devise.vkontakte_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end

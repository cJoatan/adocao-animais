class User::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  # before_action :user_already_signed_id, only: [:new]
  skip_authorization_check 

  # GET /resource/sign_in
  def new
     @session_page = true
     super
  end

  # POST /resource/sign_in
  def create
    if user_signed_in?
      redirect_to adoptions_url
    else
      super
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def user_already_signed_id
    redirect_to adoptions_url
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end

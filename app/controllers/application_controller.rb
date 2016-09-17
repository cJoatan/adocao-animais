class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions

  # check if controllers have authentication
  check_authorization

  def after_sign_in_path_for(resource)
     # After you enter login info and click submit, I want you to be sent to the registrations#show page
     adoptions_url
   end
end

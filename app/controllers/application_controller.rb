class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  # https://github.com/plataformatec/devise/wiki/How-To:-redirect-to-a-specific-page-on-successful-sign-in

  # Overwriting the sign_out redirect path method
  

  protected

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end
  
end

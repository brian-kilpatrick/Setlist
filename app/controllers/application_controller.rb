class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_org


private

# How
  def set_org
      if user_signed_in?
        if current_user.organizations.count >= 1
         @current_org = current_user.organizations.first
         session[:organization_id] = @current_org.id
      end
    end
  end

end

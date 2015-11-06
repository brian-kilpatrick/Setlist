class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_org


  private

  def set_org
  	if user_signed_in?
  	@current_org = current_user.organizations.first
  	end
  end
end

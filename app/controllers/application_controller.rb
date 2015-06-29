class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
def authorize_admin
    redirect_to request.url if !current_user.admin
    #redirects to previous page
end
end

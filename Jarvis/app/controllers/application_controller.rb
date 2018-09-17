class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods
  helper_method :current_user
  helper_method :logged_in?
  # before_action :verify_authentication

  def verify_authentication
    user = authenticate_with_http_token do |token, options|
      User.find_by_api_token(token)
    end

    unless user
      render json: { error: "You don't have permission to access these resources" }, status: :unauthorized
    end
end
  
  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end

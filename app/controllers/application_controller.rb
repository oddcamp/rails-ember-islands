class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :log_in_test_user

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def log_in_test_user
      @current_user = User.first
      flash[:info] = "This is a test app and we have assigned you a test user :)"
    end
end

class ApplicationController < ActionController::Base

    private

    def confirm_logged_in
      unless session[:user_id]
        flash[:notice]="Please log in first."
        redirect_to(users_path)
      end
    end
  
  
  
end

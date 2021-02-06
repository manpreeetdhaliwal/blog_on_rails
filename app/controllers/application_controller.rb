class ApplicationController < ActionController::Base
    private

    def user_signed_in?
        current_user.present?
    end
    helper_method :user_signed_in?

    def current_user
        if session[:user_id].present?
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    helper_method :current_user

    def authenticate_user!
        unless user_signed_in?
            flash[:alert] = "You must sign in or sign up first."
            redirect_to root_path
        end
    end
    # private 
    # def current_user
    #     if session[:user_id].present?
    #          @current_user = User.find session[:user_id]
    #     end
    # end
    # helper_method :current_user
    # def user_signed_in?
    #     current_user.present?
    # end
    # helper_method :user_signed_in?
    # def authenticate_user!
    #     unless user_signed_in?
    #         flash[:danger] = "You need to be signed in first"
    #         redirect_to new_session_path
    #     end
    # end
    # helper_method :authenticate_user!
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def require_login
    redirect_to '/sessions/new' if session[:user_id] == nil
  end

  def require_correct_user
    user = User.find(params[:id])
    redirect_to "/users/#{current_user.id}" if current_user != user
  end

  def current_user
  	if session[:user_id]
  		if !User.exists?(session[:user_id])
  			session.clear
  			return
  		end
	    User.find(session[:user_id])
	end
  end
  helper_method :current_user
end

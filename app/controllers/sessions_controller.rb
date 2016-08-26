class SessionsController < ApplicationController
	def new	
	end

	def create
		@user = User.find_by_name(user_params[:name])
    	if @user && @user.authenticate(user_params[:password])
      		session[:user_id] = @user.id
      		redirect_to campaigns_path, notice: "User successfully updated!"
    	else

      		redirect_to new_session_path, notice: "Invalid Credentials"
    	end
	end

	def destroy
		session[:user_id] = nil
    	redirect_to new_session_path, notice: "You have been logged out."
	end



	private
	def user_params
		params.require(:user).permit(:name, :password)
	end
end

class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

	def new
		
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = current_user
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
      		redirect_to campaigns_path
      	else
      		flash[:errors] = @user.errors.full_messages
      		redirect_to new_session_path
      	end
	end

	def update
		@user = User.find(params[:id])
		User.where(id: params[:id]).limit(1).update_all(user_params)
		redirect_to campaigns_path
	end

	def destroy
		User.destroy(params[:id])
		session.clear
		redirect_to new_session_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :password)
	end
end

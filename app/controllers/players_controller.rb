class PlayersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	# before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

	def index
		@players = Player.where(user_id: current_user.id)
	end

	def show
		@player = Player.find(params[:id])
	end

	def new
		
	end

	

	def edit
		@player = Player.find(params[:id])
	end

	def create
		@player = Player.new(player_params)
		@player.active=true
		if @player.save
      		redirect_to campaign_path(@player.campaign_id)
      	else
      		flash[:errors] = @player.errors.full_messages
      		redirect_to campaign_path(@player.campaign_id)
      	end
	end

	def update
		@player = Player.find(params[:id])
		Player.where(id: params[:id]).limit(1).update_all(player_params)
		redirect_to campaign_path(@player.campaign_id)
	end

	def destroy
		Player.destroy(params[:id])
		redirect_to (:back)
	end

	private
	def player_params
		params.require(:player).permit(:name, :notes, :bonus, :campaign_id)
	end
end

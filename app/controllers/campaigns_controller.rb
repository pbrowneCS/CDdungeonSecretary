class CampaignsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]
	def index
  		@campaigns = Campaign.where(user_id: current_user)
  	end

  	def show
      camp_id = params[:id]
      @campaign = Campaign.find(params[:id])
  		@encounters = Encounter.where(campaign_id: camp_id)
      @players = Player.where(campaign_id: camp_id) 
  	end

	  def create
  		@campaign = Campaign.new(campaign_params)
  		if @campaign.save
  			redirect_to campaigns_path
  		else
  			flash[:errors] = @campaign.errors.full_messages
    	  	redirect_to campaigns_path
    	end
  	end

  	def destroy
  		campaign = Campaign.find(params[:id])
  		campaign.destroy if campaign.user == current_user
  		redirect_to campaigns_path
  	end

  	

	private
  	def campaign_params
  		params.require(:campaign).permit(:name, :description, :user_id)
  	end
end

class EnemiesController < ApplicationController
	
	def show
		@enemy = Enemy.find(params[:id])
	end

	def edit
		@enemy = Enemy.find(params[:id])
	end

	def create
		@enemy = Enemy.new(enemy_params)
		@enemy.active = true
		if @enemy.save
      		redirect_to (:back)
      	else
      		flash[:errors] = @enemy.errors.full_messages
      		redirect_to (:back)
      	end
	end

	def update
		@enemy = Enemy.find(params[:id])
		Enemy.where(id: params[:id]).limit(1).update_all(enemy_params)
		redirect_to campaign_path(@encounter.campaign_id)
	end

	def destroy 
		Enemy.destroy(params[:id])
		redirect_to (:back)
	end

	private
	def enemy_params
		params.require(:enemy).permit(:name, :notes, :bonus, :encounter_id)
	end

end

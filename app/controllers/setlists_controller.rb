class SetlistsController < ApplicationController
	before_action :authenticate_user!
	def new
		
	end

	def create
		@setlist = Setlist.create
		redirect_to edit_setlist_path(@setlist)
	end

	def show
		@setlist = Setlist.find(params[:id])
	end

	def edit
		@setlist = Setlist.find(params[:id])
	end

	def sort
		
	end

	def update
		# @setlist = Setlist.find(params[:id])
		# @setlist.update_attributes(setlist_params)
		if !params[:order].nil?
			params[:order].each do |key,value|
				Item.find(value[:id]).update_attribute(:position,value[:position])
			end
			render :nothing => true
		else
			redirect_to edit_setlist_path(@setlist) 
		end
	end

	def destroy
		@setlist = Setlist.find(params[:id])
		@setlist.destroy
		flash[:message] = "Setlist Deleted!"
		redirect_to root_path
	end

	private

	def setlist_params
		params.require(:setlist).permit(:name,:performance_date, :performance_time, :rehearsal_date, :rehearsal_time)
	end
end

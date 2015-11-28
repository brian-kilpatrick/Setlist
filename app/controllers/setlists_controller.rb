class SetlistsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_setlist, except: [:create, :update]
	def new
		
	end

	def create
		@setlist = Setlist.create(organization_id: @current_org.id, name: "New Setlist #{Time.now.to_s(:long)}")
		redirect_to edit_setlist_path(@setlist)
	end

	def show
	
	end

	def edit
	
	end

	def sort
		
	end

	def update
		# need to get @setlist from prior params id
		@setlist.update_attributes(setlist_params)
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
	
		@setlist.destroy
		flash[:message] = "Setlist Deleted!"
		redirect_to root_path
	end

	private

	def set_setlist
		@setlist = Setlist.find(params[:id])
	end

	def setlist_params
		params.require(:setlist).permit(:name,:performance_date, :performance_time, :rehearsal_date, :rehearsal_time)
	end
end

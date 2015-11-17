class SetlistsController < ApplicationController
	before_action :authenticate_user!
	def new
		
	end

	def create
		@setlist = Setlist.create
		redirect_to edit_setlist_path(@setlist)
	end

	def show
	end

	def edit
		@setlist = Setlist.find(params[:id])
	end

	def sort
		
	end

	def update
		params[:order].each do |key,value|
			Item.find(value[:id]).update_attribute(:position,value[:position])
		end
		render :nothing => true
	end

	def destroy
		@setlist = Setlist.find(params[:id])
		@setlist.destroy
		flash[:message] = "Setlist Deleted!"
		redirect_to root_path
	end
end

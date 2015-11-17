class ItemsController < ApplicationController
	respond_to :html
	before_action :find_setlist!, only: [:create, :destroy]

	def create
		@item = @setlist.items.build(items_params)
		if @item.save
			respond_to do |format|
				format.html
				format.js
			end 
		else
			flash[:message] = "Something Went Wrong"
		end
	end

	def destroy
		@item = Item.find(params[:id])
		if @item.destroy

			respond_to do |format|
				format.html
				format.js
			end
		end
	end

	private

	def find_setlist!
		@setlist = Setlist.includes(:items).find(params[:setlist_id])
	end

	def items_params
		params.permit(:arrangement_id, :setlist_id)
	end
end


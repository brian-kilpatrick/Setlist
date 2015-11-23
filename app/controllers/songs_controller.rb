class SongsController < ApplicationController
	def show
		@song = Song.find(params[:id])
		@song_arrangement = @song.arrangements.first
		if @song.organization != @current_org
			redirect_to root_path
		end
	end

	def new
		@song = Song.new
		@song.arrangements.new 
	end

	def create
		@song = Song.new(song_params)
		@song.organization = @current_org
		@song.arrangements.first.organization = @current_org

		if @song.save
			flash[:message] = "Song Successfully Created"
			redirect_to @song
		else
			flash[:message] = "Something Went Wrong"
			render 'new'
		end
	end

	private
	def song_params
		params.require(:song).permit(:name, :artist, arrangements_attributes: [:title, :keyof, :length, :lyrics, :bpm])
	end
end

class SongsController < ApplicationController
  def new
  	@song = Song.new
  	@song.arrangements.new 
  end

  def create
  	@song = Song.new(song_params)
    

  	if @song.save
  		flash[:message] = "Song Successfully Created"
  		redirect_to root_path
  	else
  		flash[:message] = "Something Went Wrong"
  		render 'new'
  	end
  end

  private
  	def song_params
  		params.require(:song).permit(:name, arrangements_attributes: [:title, :keyof, :length, :lyrics, :bpm])
  	end
end

class SongsController < ApplicationController 
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all 
    end 

    def new
        @song = Song.new
    end 

    def create
        @song = Song.new(song_params)

        # if @song.valid?
            if @song.save
            redirect_to song_path(@song)
        else 
            render :new
        end 
    end 

    def show
        # @song = Song.find_by(:id => params[:id])
    end 

    def edit 
        # @song = Song.find_by(:id => params[:id])
    end 

    def update
        # @song = Song.find_by(params[:id])
        if @song.update(song_params)

        # if @song.valid? 
        #     @song.save 
            redirect_to song_path(@song)
        else 
            render :edit 
        end 
    end 

    def destroy
        # Song.find_by(params[:id]).destroy
        @song.destroy
        redirect_to songs_path
    end 

    private 
    
    def song_params
    # set_song! 
        # @song = Song.find(params[:id])
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end 

    def set_song
    # song_params
        @song = Song.find(params[:id])
        # params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end 

end 
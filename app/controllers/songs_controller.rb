class SongsController < ApplicationController
    
    get '/songs' do
        @songs = Song.all
        erb :"song/index"
    end

    get '/songs/new' do
        erb :"song/new"
    end

    post '/songs' do
        @song= Song.create(params[:song])
        @song.artist = Artist.find_or_create_by(params[:artist])
        @song.genres_ids = (params[:genres])
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @artist = @song.artist
        @genre = @song.genres
        erb :"song/show"

    end


end
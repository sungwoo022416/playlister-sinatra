class GenresController < ApplicationController
    
    get '/genres' do
        @genres = Genre.all
        erb :"genre/index"
    end

    get '/genres/:slug' do
        @genre = Genre.find_by_slug(params[:slug])
        @artists = @genre.artists
        @songs = @genre.songs
        erb :"genre/show"
    end

    


end
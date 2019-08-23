module Api
    module V1
      class PlaylistsController < ApplicationController

        def index
        #   if statement returns playlists associated with a user if user_id present in url
        #   else returns all playlists in db if a user_id is not present in url
          if params[:user_id].present?
            @playlists = Playlist.where(user_id: params[:user_id])
          else
            @playlists = Playlist.all
          end

          render json: @playlists
        end
  
        def show
          #this will find a playlist by it's unique id
          @playlist = Playlist.find(params[:id])
  
          render json: @playlist
        end
  
        def create
          @playlist = Playlist.new(user_id: params[:user_id], playlist_params)
  
          if @playlist.save
            render json: @playlist, status: :created
          else
            render json: @playlist.errors, status: :unprocessable_entity
          end
        end
  
        private
  
        def playlist_params
        # delete .require(:playlist) off of params
          params.permit(:name)
        end
      end
    end
  end
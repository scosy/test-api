class Api::V1::VideoGamesController < ApplicationController
  before_action :set_video_game, only: %i[ show update destroy ]

  # GET /video_games
  def index
    @video_games = VideoGame.all

    render json: @video_games
  end

  # GET /video_games/1
  def show
    render json: @video_game
  end

  # POST /video_games
  def create
    @video_game = VideoGame.new(video_game_params)

    if @video_game.save
      render json: @video_game, status: :created, location: @video_game
    else
      render json: @video_game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /video_games/1
  def update
    if @video_game.update(video_game_params)
      render json: @video_game
    else
      render json: @video_game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /video_games/1
  def destroy
    @video_game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_game
      @video_game = VideoGame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_game_params
      params.require(:video_game).permit(:name, :description)
    end
end

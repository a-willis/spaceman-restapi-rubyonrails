class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @game = Game.new
  end

  # curl -X POST http://localhost:3000/games
  def create
    @game = Game.create
    
    render json: {game_id: @game.id}
  end

  # curl -X GET http://localhost:3000/games/:id
  def show
    @game = Game.find(params[:id])

    render json: {
      game_id: @game.id,
      guess: @game.guesses
    }
  end

  def edit
  end 

  def update
    @game = Game.find(params[:id])

    new_guess = params[:guess]
    
    unless @game.game_over? 
      @game.guesses = (@game.guesses.nil? ? new_guess : @game.guesses.concat(new_guess))
      @game.save!
    end 
    
    render json: {
      guess: @game.guesses, 
      guess_count: @game.guesses.split("").count, 
      revealed: @game.reveal_letter, 
      game_over: @game.game_over? 
    }
  end 
end 

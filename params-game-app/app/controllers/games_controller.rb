class GamesController < ApplicationController
  def game_query_params
    @name = params[:my_name]
    if @name.starts_with?("a")
      a_initial_true = "Hey, your name starts with the first letter of the alphabet!"
      @name = a_initial_true
    else
      @name = params[:my_name]
    end

    @number = params[:guess_number].to_i
    if @number > 66
      @answer = "Too high. Guess again!"
    elsif @number < 66
      @answer = "Too low. Guess again!"
    else  
      @answer = "You guessed right!"
    end
    render 'game.html.erb'
  end
end

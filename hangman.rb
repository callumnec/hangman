require 'set'
require_relative 'hangman_model'
require_relative 'hangman_view'
require_relative 'hangman_controller'

class Hangman
  def play

    dictionary = Dictionary.new
    random_word = dictionary.sample

    game = Game.new(6, random_word)
    controller = Controller.new(game)
    view = View.new(game)

    view.display_welcome
    while !game.game_over?
      guess = controller.ask_for_guess
      game.apply_guess(guess)
      view.display_game_state

      if game_won
        view.display_victory_message
      elsif game.game_over
        view.display_defeat_message
      end
  end
end

Hangman.new.play

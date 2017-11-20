require 'set'
require_relative 'dictionary'
require_relative 'game'
require_relative 'view'
require_relative 'controller'

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

      view.display_current_game_status

      if game.game_won?
        view.display_victory_message
      elsif game.game_over?
        view.display_defeat_message
      end
    end
  end
end

Hangman.new.play

require 'set'
require_relative 'dictionary'
require_relative 'game'
require_relative 'view'
require_relative 'controller'

class Hangman
  def play
    dictionary = Dictionary.new
    random_word = dictionary.sample

    model = Model.new(6, random_word)
    controller = Controller.new(model)
    view = View.new(model)

    view.display_welcome
    while !model.game_over?
      guess = controller.ask_for_guess
      model.apply_guess(guess)

      view.display_game_state
    end
  end
end

Hangman.new.play

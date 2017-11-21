require_relative 'dictionary'
require_relative 'model'
require_relative 'view'
require_relative 'controller'

class Hangman
  def initialize
    dictionary = Dictionary.new
    random_word = dictionary.sample

    @model = Model.new(starting_number_of_lives: 6, word_to_guess: random_word)
    @controller = Controller.new(@model)
    @view = View.new(@model)
  end

  def play
    @view.display_welcome

    take_turn until @model.game_over?
  end

  private

  def take_turn
    guess = @controller.ask_for_guess
    @model.apply_guess(guess)

    @view.display_game_state
  end
end

Hangman.new.play

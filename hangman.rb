require_relative 'dictionary'
require_relative 'model'
require_relative 'view'
require_relative 'controller'

class Hangman
  def initialize
    dictionary = Dictionary.new
    random_word = dictionary.sample

    @model = Model.new(starting_number_of_lives: 6, word_to_guess: random_word)
    @view = View.new(@model)
  end

  def play
    @view.display_welcome

    take_turn until @model.game_over?
  end

  private

  def take_turn
    guess = ask_for_guess
    @model.apply_guess(guess)

    @view.display_game_state
  end

  def ask_for_guess
    loop do
      guess = gets.chars.first

      break guess unless @model.letter_has_been_guessed?(guess)

      @view.display_bad_input_message
    end
  end
end

Hangman.new.play

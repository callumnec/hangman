class Game
  def initialize(starting_number_of_lives, word_to_guess)
    @starting_number_of_lives = starting_number_of_lives
    @word_to_guess = word_to_guess
    @guessed_letters = Set.new
  end

  def word_to_guess
    @word_to_guess
  end

  def apply_guess(guess)
    @guessed_letters << guess
  end

  def letter_in_word?(letter)
    @word_to_guess.chars.any? { |e| e == letter }
  end

  def remaining_lives
    total_mismatches = @guessed_letters
      .select { |letter| !letter_in_word?(letter) }
      .length

    @starting_number_of_lives - total_mismatches
  end

  def game_over?
    remaining_lives <= 0 || game_won?
  end

  def game_won?
    @word_to_guess.chars.all? { |letter| letter_has_been_guessed?(letter) }
  end

  def letter_has_been_guessed?(letter)
    @guessed_letters.include?(letter)
  end

  def guessed_letters
    @guessed_letters.to_a
  end

end

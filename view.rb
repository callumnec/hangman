class View
  def initialize(game)
    @game = game
  end

  def display_welcome
    puts "Try guessing my word!"
  end

  def display_victory_message
    puts "Congratulations you win!"
  end

  def display_defeat_message
    puts "You've run out of lives!"
    puts "The word was #{@game.word_to_guess}"
  end

  def display_word_to_guess
    puts @game.word_to_guess
  end

  def display_current_game_status
    puts "Lives remaining #{@game.remaining_lives}"
    puts "Current Guess:"
    display_current_guess
    puts "Guessed Letters"
    display_guessed_letters
  end

  def display_current_guess
    puts @game.word_to_guess
      .chars
      .map { |letter| @game.letter_has_been_guessed?(letter) ? letter : "_" }
      .join
  end

  def display_guessed_letters
    puts @game.guessed_letters.join(", ")
  end
end

class View
  def initialize(game)
    @model = game
  end

  def display_welcome
    puts "Try guessing my word!"
  end

  def display_victory_message
    puts "Congratulations you win!"
  end

  def display_defeat_message
    puts "You've run out of lives!"
    puts "The word was #{@model.word_to_guess}"
  end

  def display_word_to_guess
    puts @model.word_to_guess
  end

  def display_game_state
    display_current_game_status

    if @model.game_won?
      display_victory_message
    elsif @model.game_over?
      display_defeat_message
    end
  end

  def display_current_game_status
    puts "Lives remaining #{@model.remaining_lives}"
    puts "Current Guess:"
    display_current_guess
    puts "Guessed Letters"
    display_guessed_letters
  end

  def display_current_guess
    puts @model.word_to_guess
      .chars
      .map { |letter| @model.letter_has_been_guessed?(letter) ? letter : "_" }
      .join
  end

  def display_guessed_letters
    puts @model.guessed_letters.join(", ")
  end
end

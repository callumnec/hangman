class Controller
  def initialize(game)
    @game = game
  end

  def ask_for_guess
    loop do
      guess = gets.chars.first

      break guess unless @game.letter_has_been_guessed?(guess)

      puts "#{guess} has already been guessed!"
      puts "Try something else"
    end
  end
end
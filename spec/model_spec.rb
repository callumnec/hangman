
require_relative '../model'


shared_examples "is unfinished" do
  it "is not game over" do
    expect(model.game_over?).to be false
  end

  it "is not won" do
    expect(model.game_won?).to be false
  end
end

shared_examples "has guesses" do |guesses|
  it "has #{guesses.join(", ")} guessed" do
    guesses.each do |guess|
      expect(model.letter_has_been_guessed?(guess)).to be true
    end
  end
end

shared_examples "excludes guesses" do |guesses|
  it "has #{guesses.join(", ")} not guessed" do
    guesses.each do |guess|
      expect(model.letter_has_been_guessed?(guess)).to be false
    end
  end
end

describe Model do
  let(:model) { Model.new(starting_number_of_lives: 6, word_to_guess: "alphabet") }

  context "in a game with 6 lives, and \"alphabet\" as the hidden word" do
    it "has the word to guess as \"alphabet\"" do
      expect(model.word_to_guess).to eq("alphabet")
    end

    context "with nothing guessed" do
      it "has six lives remaining" do
        expect(model.remaining_lives).to eq(6)
      end

      it "has zero letters guessed" do
        expect(model.guessed_letters).to be_empty
      end

      include_examples "is unfinished"
    end

    context "with \"alphabet\" guessed" do
      before { "alphabet".each_char { |chr| model.apply_guess(chr) }}

      it "has six lives remaining" do
        expect(model.remaining_lives).to eq(6)
      end

      it "has seven letters guessed" do
        expect(model.guessed_letters.length).to eq(7)
      end

      it "is gameover" do
        expect(model.game_over?).to be true
      end

      it "is won" do
        expect(model.game_won?).to be true
      end

      include_examples "has guesses", "alphabet".chars
    end

    context "with \"zxcvnm\" guessed" do
      before { "zxcvnm".each_char { |chr| model.apply_guess(chr) }}

      it "has zero lives remaining" do
        expect(model.remaining_lives).to eq(0)
      end

      it "has six letters guessed" do
        expect(model.guessed_letters.length).to eq(6)
      end

      it "is gameover" do
        expect(model.game_over?).to be true
      end

      it "is not won" do
        expect(model.game_won?).to be false
      end

      include_examples "has guesses", "zxcvnm".chars
    end

    context "with \"a\" guessed" do
      before { model.apply_guess("a") }

      it "has six lives remaining" do
        expect(model.remaining_lives).to eq(6)
      end

      it "has one letter guessed" do
        expect(model.guessed_letters.length).to eq(1)
      end

      include_examples "is unfinished"
      include_examples "has guesses", ["a"]
      include_examples "excludes guesses", "bcd".chars
    end

    context "with \"c\" guessed" do
      before { model.apply_guess("c") }

      it "has five lives remaining" do
        expect(model.remaining_lives).to eq(5)
      end

      it "has one letter guessed" do
        expect(model.guessed_letters.length).to eq(1)
      end

      include_examples "is unfinished"
      include_examples "has guesses", ["c"]
      include_examples "excludes guesses", "abd".chars

    end

    context "with \"a\" and \"c\" guessed" do
      before do
        model.apply_guess("a")
        model.apply_guess("c")
      end

      it "has five lives remaining" do
        expect(model.remaining_lives).to eq(5)
      end

      it "has one letter guessed" do
        expect(model.guessed_letters.length).to eq(2)
      end

      include_examples "is unfinished"
      include_examples "has guesses", ["a", "c"]
      include_examples "excludes guesses", ["b", "d"]
    end

    context "with \"a\" guessed twice" do
      before do
        model.apply_guess("a")
        model.apply_guess("a")
      end

      it "has six lives remaining" do
        expect(model.remaining_lives).to eq(6)
      end

      it "has one letter guessed" do
        expect(model.guessed_letters.length).to eq(1)
      end

      include_examples "is unfinished"
      include_examples "has guesses", ["a"]
      include_examples "excludes guesses", "bcd".chars
    end
  end
end

# describe Model do
#   let(:model) { Model.new(starting_number_of_lives: 6, word_to_guess: "alphabet") }
#
#   describe "#word_to_guess" do
#     it "returns the random word used in the game" do
#       expect(model.word_to_guess).to eq("alphabet")
#     end
#   end
#
#   describe "#word_to_guess2" do
#     subject { model.word_to_guess }
#
#     context "returns the target word" do
#       it { is_expected.to eq("alphabet") }
#     end
#   end
#
#   subject { model.guessed_letters }
#
#   context "it adds the guessed letter to the guessed letter set" do
#     before { model.apply_guess("a") }
#     it     { is_expected.to include("a") }
#   end
#
#   it "adds the letter" do
#     model.apply_guess("a")
#     expect(model.guessed_letters.include?("a")).to be true
#   end
#
#   describe "#"
# end


require_relative '../model'

describe Model do
  let(:model) { Model.new(starting_number_of_lives: 6, word_to_guess: "alphabet") }

  context "in a game with 6 lives, and \"alphabet\" as the hidden word" do
    it "should have the word to guess as \"alphabet\"" do
      expect(model.word_to_guess).to eq("alphabet")
    end

    context "initially" do
      it "should have six lives remaining" do
        expect(model.remaining_lives).to eq(6)
      end

      it "should have no letters guessed" do
        expect(model.guessed_letters).to be_empty
        expect(model.letter_has_been_guessed?("a")).to be false
        expect(model.letter_has_been_guessed?("g")).to be false
        expect(model.letter_has_been_guessed?("z")).to be false
      end

      it "should not be game over" do
        expect(model.game_over?).to be false
      end

      it "should not be won" do
        expect(model.game_won?).to be false
      end
    end

    context "after guessing \"a\"" do
      before { model.apply_guess("a") }

      it "should have six lives remaining" do
        model.apply_guess("a")
        expect(model.remaining_lives).to eq(6)
      end

      it "should have only \"a\" guessed" do
        expect(model.guessed_letters.length).to eq(1)
        expect(model.letter_has_been_guessed?("a")).to be true
        expect(model.letter_has_been_guessed?("g")).to be false
        expect(model.letter_has_been_guessed?("z")).to be false
      end
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

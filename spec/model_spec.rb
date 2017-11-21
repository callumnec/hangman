
require_relative '../model'

describe Model do
  #let(:model) { Model.new(starting_number_of_lives: 6, word_to_guess: "alphabet") }

  context "in a game with 6 lives, and \"alphabet\" as the hidden word" do
    subject { Model.new(starting_number_of_lives: 6, word_to_guess: "alphabet") }

    it "should have the word to guess as \"alphabet\"" do
      expect(subject.word_to_guess).to eq("alphabet")
    end

    context "initially" do
      #subject { model }
      it "should have six lives remaining" do
        expect(subject.remaining_lives).to eq(6)
      end

      it "should have no letters guessed" do
        expect(subject.guessed_letters).to be_empty
        expect(subject.letter_has_been_guessed?("a")).to be false
        expect(subject.letter_has_been_guessed?("g")).to be false
        expect(subject.letter_has_been_guessed?("z")).to be false
      end

      it "should not be game over" do
        expect(subject.game_over?).to be false
      end

      it "should not be won" do
        expect(subject.game_won?).to be false
      end
    end

    context "after guessing \"a\"" do
      before(:all) { subject.apply_guess("a") }

      it "should have six lives remaining" do
        subject.apply_guess("a")
        expect(subject.remaining_lives).to eq(6)
      end

      it "should have only \"a\" guessed" do
        before{subject.apply_guess("a")}
        expect(subject.guessed_letters.length).to eq(1)
        # it {is_expected.to be true}
        expect(subject.letter_has_been_guessed?("a")).to be true
        expect(subject.letter_has_been_guessed?("g")).to be false
        expect(subject.letter_has_been_guessed?("z")).to be false
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

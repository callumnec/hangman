class Dictionary
  def initialize
    @words = IO.read("words.txt").split
  end

  def sample
    @words.sample
  end
end

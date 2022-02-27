class Game < ApplicationRecord
  # has_many :guesses, dependent: :destroy

  after_create :select_word

  def reveal_letter
    word.chars.map { |x| guesses.include?(x) ? x : "-" }.join("")
  end 

  def game_over?
    if guesses.nil?
      return false
    else
      word.chars.all? { |x| guesses.include?(x) }
    end 
  end 

  private

  def select_word
    
    self.word = [
      "bookworm",
      "jigsaw",
      "gnarly",
      "pneumonia",
      "frazzled",
      "microwave",
      "vortex",
      "dimension",
      "rhythm",
      "banjo"
    ].sample
    
    self.save!

  end 

end

class AddGuessesColumnToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :guesses, :string
  end
end

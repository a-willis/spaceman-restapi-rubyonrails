class AddGameForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :guesses, :games
  end
end

class CreateGuesses < ActiveRecord::Migration[6.0]
  def change
    create_table :guesses do |t|
      t.string :letter_guessed
      t.integer :game_id

      t.timestamps
    end
  end
end

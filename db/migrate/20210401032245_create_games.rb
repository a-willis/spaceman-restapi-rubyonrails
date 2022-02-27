class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :word
      t.string :guesses

      t.timestamps
    end
  end
end

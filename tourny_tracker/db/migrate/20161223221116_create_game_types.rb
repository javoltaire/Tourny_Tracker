class CreateGameTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :game_types do |t|
      t.string :game_type

      t.timestamps
    end
    add_index :game_types, :game_type, unique: true
  end
end

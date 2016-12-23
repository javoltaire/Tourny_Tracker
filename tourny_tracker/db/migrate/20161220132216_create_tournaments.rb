class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :team_count
      t.integer :group_count
      t.integer :max_teammates
      t.string :status
      t.references :game_type

      t.timestamps
    end
    
    add_index :tournaments, :name, unique: true
  end
end

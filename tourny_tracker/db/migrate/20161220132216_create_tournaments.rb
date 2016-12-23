class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :team_count
      t.integer :group_count
      t.integer :max_teammates
      t.string :status
      t.text :description

      t.timestamps
    end
    
    add_index :tournament, :name, unique: true
  end
end

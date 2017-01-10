class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :team_count
      t.boolean :use_grouping
      t.references :elimination_type, foreign_key: true
      t.integer :team_size
      t.references :game, foreign_key: true
      t.references :tournament_state, foreign_key: true
      t.integer :created_by, foreign_key: true

      t.timestamps
    end
  end
end

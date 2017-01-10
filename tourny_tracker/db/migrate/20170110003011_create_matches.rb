class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :home_team_score
      t.references :home_team, foreign_key: true
      t.integer :away_team_score
      t.references :away_team, foreign_key: true
      t.string :round
      t.timestamps
    end
  end
end
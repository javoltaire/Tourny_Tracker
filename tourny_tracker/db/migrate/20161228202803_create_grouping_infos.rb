class CreateGroupingInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :grouping_infos do |t|
      t.references :elimination_type, foreign_key: true
      t.integer :group_count
      t.integer :teams_per_group
      t.integer :playoffs_advanced
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end

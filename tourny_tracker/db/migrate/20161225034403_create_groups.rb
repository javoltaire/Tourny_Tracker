class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.references :group_name, foreign_key: true
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end

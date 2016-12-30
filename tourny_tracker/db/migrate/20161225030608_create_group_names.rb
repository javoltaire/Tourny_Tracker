class CreateGroupNames < ActiveRecord::Migration[5.0]
  def change
    create_table :group_names do |t|
      t.string :name
      t.timestamps
    end

    add_index :group_names, :name, unique: true
  end
end

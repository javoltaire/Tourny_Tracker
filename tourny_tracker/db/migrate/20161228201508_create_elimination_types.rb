class CreateEliminationTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :elimination_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :elimination_types, :name, unique: true
  end
end

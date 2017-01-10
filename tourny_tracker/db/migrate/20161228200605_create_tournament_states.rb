class CreateTournamentStates < ActiveRecord::Migration[5.0]
  def change
    create_table :tournament_states do |t|
      t.string :state

      t.timestamps
    end
    add_index :tournament_states, :state, unique: true
  end
end

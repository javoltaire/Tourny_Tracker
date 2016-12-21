class CreateTournamentsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments_users, id: false do |t|
      t.belongs_to :tournament
      t.belongs_to :user
    end
  end
end

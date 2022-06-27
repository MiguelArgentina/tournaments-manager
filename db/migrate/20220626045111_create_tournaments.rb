class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :game_mode
      t.integer :rounds
      t.integer :team_members
      t.datetime :start_date
      t.references :creator, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end

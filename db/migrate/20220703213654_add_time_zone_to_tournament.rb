class AddTimeZoneToTournament < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :time_zone, :string
  end
end

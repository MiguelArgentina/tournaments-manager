class FixTeamMembersColumnName < ActiveRecord::Migration[7.0]
  def change
    change_table :tournaments do |t|
      t.rename :team_members, :team_member
    end
  end
end

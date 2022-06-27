# == Schema Information
#
# Table name: tournaments
#
#  id           :bigint           not null, primary key
#  game_mode    :integer
#  name         :string
#  rounds       :integer
#  start_date   :datetime
#  team_members :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  creator_id   :bigint           not null
#
# Indexes
#
#  index_tournaments_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#
require "test_helper"

class TournamentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

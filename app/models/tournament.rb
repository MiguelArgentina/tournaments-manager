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
class Tournament < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :registrations

  validates :name, presence: true
  validates :start_date, presence: true

  enum :game_mode, %i(br multi versus)
  enum :team_members, %i(single duos squad)

  scope :active, -> { where("start_date >= ?", Time.zone.now) }
  scope :inactive, -> { where("start_date < ?", Time.zone.now) }

  MAX_ROUNDS = 10
end

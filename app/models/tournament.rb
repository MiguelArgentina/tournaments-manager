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
#  time_zone    :string
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
  scope :newest_first, -> { order('start_date desc') }

  MAX_ROUNDS = 10

  def active?
    start_date.after? Time.zone.now
  end

  def expired?
    start_date.before? Time.zone.now
  end
end

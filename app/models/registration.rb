# == Schema Information
#
# Table name: registrations
#
#  id            :bigint           not null, primary key
#  active        :boolean          default(TRUE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  tournament_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_registrations_on_tournament_id  (tournament_id)
#  index_registrations_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (tournament_id => tournaments.id)
#  fk_rails_...  (user_id => users.id)
#
class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :tournament


  scope :mine, -> { where(user_id: current_user.id) }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
end

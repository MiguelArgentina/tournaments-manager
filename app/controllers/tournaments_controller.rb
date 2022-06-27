class TournamentsController < ApplicationController
  include DryController

  def index
    super
    @resources = @resources.active
  end

  private
  def resource_params
    accessible = []
    accessible << [:rounds, :game_mode, :creator_id, :team_members, :start_date, :name]
    params.require(:tournament).permit(accessible)
  end
end

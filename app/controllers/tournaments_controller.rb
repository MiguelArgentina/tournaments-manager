class TournamentsController < ApplicationController
  include DryController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    super
    @resources = @resources.active.newest_first.reverse
    @resources = @resources + Tournament.inactive unless params[:active]
  end

  def my_agenda
    @resources = current_user.registrations.includes(:tournament).sort_by { |r| r.tournament.start_date }
    #binding.pry
  end

  def show
    super
    @registrations = @resource.registrations.includes(:user)
  end

  private
  def resource_params
    accessible = []
    accessible << [:rounds, :game_mode, :creator_id, :team_members, :start_date, :name, :time_zone]
    params.require(:tournament).permit(accessible)
  end
end

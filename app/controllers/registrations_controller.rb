class RegistrationsController < ApplicationController
  include DryController

  def new
    super
    @tournaments = Tournament.active
  end

  def register_player
    user_id = params[:user_id]
    tournament_id = params[:tournament_id]
    registration = Registration.find_by(tournament_id: tournament_id, user_id: user_id)
    if registration.nil?
      Registration.create(tournament_id: params[:tournament_id], user_id: params[:user_id])
    else
      registration.update(active: !to_bool(params[:active]))
    end
    redirect_to url_for(request.referrer), status: :unprocessable_entity
  end

  private
  def resource_params
    accessible = []
    accessible << [:active, :tournament_id, :user_id]
    params.require(:registration).permit(accessible)
  end

    def to_bool my_string
      return true if ['true', '1', 'yes', 'on', 't'].include? my_string
      return false if ['false', '0', 'no', 'off', 'f'].include? my_string
      return nil
    end

end

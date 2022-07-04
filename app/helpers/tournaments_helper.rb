module TournamentsHelper
  def number_of_players tournament:
    players = tournament.registrations.where(active: true).count
    case players
    when 0
      "No players"
    when 1
      "1 player"
    else
      "#{players} players"

    end
  end
end

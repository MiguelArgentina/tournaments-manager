module TournamentsHelper
  def number_of_players tournament:
    players = tournament.registrations.where(active: true).count
    case players
    when 0
      t('views.tournaments.no_players')
    when 1
      t('views.tournaments.one_player')
    else
      "#{players} #{t('views.tournaments.many_players')}"
    end
  end
end

module RegistrationsHelper
  def user_is_registered?(tournament_id:)
    if current_user
      current_user.registrations.find_by(tournament_id: tournament_id)&.active
    else
      nil
    end
  end

  def add_button status:
    puts status
    if status.present?
      content_tag :button, type: :submit, class: "btn btn-danger bg-primary bg-opacity-25 rounded-pill fw-light text-white lh-base py-0 px-2", style: "font-size: 0.7rem;" do
        'Abandonar'
      end
    else
      content_tag :button, type: :submit, class: "btn btn-success bg-success bg-opacity-25 rounded-pill fw-light text-white lh-base py-0 px-2", style: "font-size: 0.7rem;" do
      'Jugar'
      end
    end
  end
end

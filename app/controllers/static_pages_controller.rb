class StaticPagesController < ApplicationController
  def landing_page
    @resources = Tournament.active
  end

  def dashboard
  end
end

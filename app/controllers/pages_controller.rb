class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @npcs = Npc.where(user_id: current_user.id)

    @markers = @npcs.geocoded.map do |npc|
      {
        lat: npc.latitude,
        lng: npc.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {npc: npc}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end

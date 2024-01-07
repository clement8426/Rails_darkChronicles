class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @user = current_user
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

  def mj
    @groups = current_user.managed_groups.includes(:joueurs)
    @group = Group.new

  end

  def joueur
    @sheets = current_user.sheets
    user = current_user

    @group_id = user.group_id
    @group = Group.find_by(id: @group_id)
  end

end

class NpcController < ApplicationController
  def index
    # search_params_present = params[:query].values.any?(&:present?)
    search_params_present = params[:query].present? && params[:query].values.any?(&:present?)

    if search_params_present
      search_criteria = "#{params[:query][:query]} #{params[:query][:clan_category]} #{params[:query][:generation_category]} #{params[:query][:secte_category]}".strip
      @npcs = Npc.where(user_id: current_user.id).global_search(search_criteria)

    else
      @npcs = Npc.where(user_id: current_user.id)
    end
  end
end

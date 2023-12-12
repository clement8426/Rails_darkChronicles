class NpcController < ApplicationController
  def index
    if params[:query].present?
      search_criteria = params[:query].slice(:clan_category, :generation_category, :secte_category)
      @npcs = Npc.where(user_id: current_user.id).global_search(search_criteria)

      redirect_to npc_index_path
    else
      @npcs = Npc.where(user_id: current_user.id)
      redirect_to npc_index_path
    end
  end
end

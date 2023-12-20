class NpcController < ApplicationController
  before_action :authenticate_user!

  # Other actions...
  before_action :authenticate_user!

  def index
    @npcs = Npc.where(user_id: current_user.id)

    if search_params_present
      search_criteria = "#{params[:query][:query]} #{params[:query][:clan_category]} #{params[:query][:generation_category]} #{params[:query][:secte_category]}".strip
      @npcs = Npc.where(user_id: current_user.id).global_search(search_criteria)
    else
      @npcs = Npc.where(user_id: current_user.id)
    end
  end

  def create
    @npc = current_user.npcs.new(npc_params)

    if @npc.save
      respond_to do |format|
        format.html { redirect_to @npc, notice: 'PNJ créé avec succès.' }
        format.json { render json: @npc, status: :created, location: @npc }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @npc.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @npc = Npc.find(params[:id])
  end

  def update
    @npc = Npc.find(params[:id])

    if @npc.update(npc_params_edit)
      respond_to do |format|
        format.html { redirect_to @npc, notice: 'PNJ mis à jour avec succès.' }
        format.json { render json: @npc, status: :ok, location: @npc }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @npc.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @npc = Npc.find(params[:id])

    if @npc.destroy
      respond_to do |format|
        format.html { redirect_to npc_index_path, notice: 'NPC supprimé avec succès.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to npc_index_path, alert: 'Erreur lors de la suppression du NPC.' }
        format.json { render json: @npc.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def npc_params
    params.require(:new_character).permit(:name, :clan, :secte, :generation, :address, :description)
  end

  def npc_params_edit
    params.require(:npc).permit(:name, :clan, :secte, :generation, :address, :description)
  end

  def search_params_present
    params[:query].present? && params[:query].values.any?(&:present?)
  end
end

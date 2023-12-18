class GroupsController < ApplicationController
  # def index
  #   if params[:query].present? && params[:query][:query].present?
  #     @users = User.where(type: "joueur").search_by_name(params[:query][:query])

  #   else
  #     @users = User.where(type: "joueur")
  #   end
  # end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.maitre_de_jeu = current_user

    if @group.save
      respond_to do |format|
        format.html { redirect_to mj_path }
        format.json { render json: @group, status: :created, location: @npc }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_path = if @group.destroyed?
                      groups_path
                    else
                      mj_path
                    end

    respond_to do |format|
      format.html { redirect_to redirect_path, notice: 'Group was successfully destroyed.' }
      format.json { render json: @group, status: :created, location: @group }
    end
  end

  def search
    @users = User.search_by_name(params[:query])
  end

  def add_user
    @group = Group.find(params[:id])

    if params[:query].present? && params[:query][:query].present?
      @users = User.where(type: "joueur").search_by_name(params[:query][:query])

    else
      @users = User.where(type: "joueur")
    end
  end

  def add_user_to_group
    @group = Group.find(params[:id])
    @user = User.find(params[:user_id])

    if @group.joueurs << @user
      redirect_to group_path(@group), notice: "Joueur ajouté au groupe avec succès."
    else
      # Gérer l'échec, par exemple, en redirigeant vers une page d'erreur
      redirect_to root_path, alert: "Impossible d'ajouter le joueur au groupe."
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

end

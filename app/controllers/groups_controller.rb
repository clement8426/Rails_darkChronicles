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
      render turbo_stream: turbo_stream.replace('your-frame-id', partial: 'groups/index')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@group) }
      format.html { redirect_to groups_path, notice: 'Group was successfully destroyed.' }
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

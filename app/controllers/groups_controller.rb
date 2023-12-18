class GroupsController < ApplicationController
  def index
    if params[:query].present? && params[:query][:query].present?
      @users = User.where(type: "joueur").search_by_name(params[:query][:query])

    else
      @users = User.where(type: "joueur")
    end
  end

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


  def add_user
    @group = Group.find(params[:id])
    @user = User.find(params[:user_id])

    if @group.joueurs << @user
      redirect_to @group, notice: 'User added to the group successfully.'
    else
      redirect_to @group, alert: 'Failed to add user to the group.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

end

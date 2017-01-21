class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update]

  def index
    @groups = group_list
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループが作成されました。'
    else
      flash.now[:alert] = 'グループ名を入力してください。'
      render :new
    end
  end

  def show
    @groups = group_list
  end

  def edit
  end

  def update
    if @group.update(group_params)
       redirect_to group_messages_path(@group), notice: 'グループが編集されました。'
    else
      flash.now[:alert] = 'グループ名を入力してください。'
      render :edit
    end
  end


  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:group_name, user_ids: [])
  end

  def group_list
    Group.includes(:users).where(groups_users: {user_id: current_user.id})
  end

end


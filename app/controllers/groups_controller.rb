class GroupsController < ApplicationController
  before_action :authenticate_user!, :set_group, only: [:show, :update]

  def new
    @group = Group.new
    @message = Message.new
  end

  def index
    @groups = group_list
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループが作成されました。'
    end
  end

  def show
    @groups = group_list
  end

  def edit
    @group = Group.includes(:users).find(params[:id])
  end

  def update
    @group.update(group_params)
    redirect_to group_messages_path(@group), notice: 'グループが編集されました。'
  end


 private
  def set_group
    @group = Group.find(params[:id])
  end
  def group_params
    params.require(:group).permit(:group_name, :group_id, {user_ids: []})
  end

  def group_list
    Group.includes(:users).where(groups_users: {user_id: current_user.id})
  end

end


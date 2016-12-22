class GroupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.new
  end

  def index
    @groups = group_list
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to group_path(id: @group.id), notice: 'グループが作成されました。'
    end
  end

 def show
  @group = Group.find(params[:id])
  @groups = group_list
 end

 def edit
    @group = Group.includes(:users).find(params[:id])
 end

 def update
      group = Group.find(params[:id])
      group.update(group_params)
      redirect_to group_path(id: group.id), notice: 'グループが編集されました。'
  end


  private
    def group_params
      params.require(:group).permit(:group_name, {user_ids: []})
    end

    def group_list
      Group.includes(:users).where(groups_users: {user_id: current_user.id})
    end

end


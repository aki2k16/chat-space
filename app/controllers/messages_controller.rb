class MessagesController < ApplicationController

 def index
  @groups = group_list
  @group = Group.find(params[:group_id])
  @message = Message.new
 end

 def new
  @group = Group.new
  @message = Message.new
 end

 def create
  @message = Message.create(message_params)
  redirect_to group_messages_path(params[:group_id])
 end

 private
 def message_params
  params.require(:message).permit(:body, :group_id).merge(user_id: current_user.id ,group_id: params[:group_id])
 end

 def group_list
  Group.includes(:users).where(groups_users: {user_id: current_user.id})
 end

 def group_params
  params.require(:group).permit(:group_name, {user_ids: []})
 end
end

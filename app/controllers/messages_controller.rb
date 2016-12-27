class MessagesController < ApplicationController

 def index
  @groups = group_list
  @group = Group.find(params[:group_id])
  @message = Message.new
 end

 def create
  @message = current_user.messages.new(message_params)
  if @message.save
    redirect_to group_messages_path(params[:group_id]), notice: 'メッセージが送信されました。'
  else
    redirect_to group_messages_path(params[:group_id]), alert: 'メッセージを入力してください。'
  end
 end

 private

 def message_params
  params.require(:message).permit(:body, :group_id).merge(group_id: params[:group_id])
 end

 def group_list
  Group.includes(:users).where(groups_users: {user_id: current_user.id})
 end

 def group_params
  params.require(:group).permit(:group_name, {user_ids: []})
 end
end

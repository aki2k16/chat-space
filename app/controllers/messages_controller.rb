class MessagesController < ApplicationController

 def index
  @groups = group_list
  @group = Group.find(params[:group_id])
  @message = Message.new
  @messages = @group.messages
  respond_to do |format|
      format.html
      format.json {render json: @messages.to_json}
    end
 end

 def create
  @message = current_user.messages.new(message_params)
  if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: 'メッセージを保存しました。' }
        format.json { render json:{
          body: @message.body,
          image: @message.image.to_s,
          name: @message.user.name,
          created_at: @message.created_at.strftime("%Y/%m/%d %H:%M:%S")
          }
        }
      end
    else
      redirect_to group_messages_path , alert: 'メッセージを記入してください。'
    end
 end

 private

 def message_params
  params.require(:message).permit(:body, :image, :group_id).merge(group_id: params[:group_id])
 end

 def group_list
  Group.includes(:users).where(groups_users: {user_id: current_user.id})
 end

 def group_params
  params.require(:group).permit(:group_name, {user_ids: []})
 end
end

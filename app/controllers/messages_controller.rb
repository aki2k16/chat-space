class MessagesController < ApplicationController

 def index
  @groups = group_list
  @group = Group.find(params[:group_id])
  @message = Message.new
  @messages = @group.messages.includes(:user)
  respond_to do |format|
      format.html
      format.json {
        message_array = []
        @messages.each do |message|
          message_array << {
            body: message.body,
            name: message.user.name,
            image_url: message.image.url,
            created_at: message.created_at.strftime("%Y/%m/%d %H:%M:%S")
          }
        end
        render json: {
          message: message_array
    }
  }
  end
 end

 def create
  @message = current_user.messages.new(message_params)
  if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: 'メッセージを保存しました。' }
        format.json { render json:{
          body: @message.body,
          image: @message.image.url,
          name: @message.user.name,
          created_at: @message.date
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

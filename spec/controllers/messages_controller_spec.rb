require 'rails_helper'

describe MessagesController do
    let(:user) {create(:user)}
    let(:group) {create(:group)}
    let(:message) {create(:message)}

    before do
      sign_in user
    end
    after do
      sign_out user
    end
  describe 'GET #index' do
    let(:groups) {create_list(:group, 5, user_ids: user.id)}
    before do
      get :index , group_id: group.id
    end

    it "assigns the requested contact to @group" do
      expect(assigns(:group)).to match(group)
    end

    it "assigns the requested contact to @groups" do
      expect(assigns(:groups)).to match(groups)
    end

    it "renders the index template" do
      expect(response).to render_template :index
    end

  end

  describe 'Post #create' do
    let(:message) {build(:message)}

    it "save success" do
      expect {
        post :create, group_id: group.id, message: attributes_for(:message)
      }.to change(Message, :count).by(1)
    end

    it "redirect to :index" do
      post :create, group_id: group.id, message: attributes_for(:message)
      expect(response).to redirect_to group_messages_path
    end

    it "can not save in the database" do
      expect{
        post :create, group_id: group.id, message: attributes_for(:message, body: nil)
      }.not_to change(Message, :count)
    end

    it "redirects to messages#index" do
      post :create, group_id: group.id, message: attributes_for(:message, body: nil)
      expect(response).to redirect_to group_messages_path
    end
  end

end

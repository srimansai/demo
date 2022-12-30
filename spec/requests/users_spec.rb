require 'rails_helper'

describe "Users API", :type => :request do
  describe 'GET /users' do
    before do
      FactoryBot.create(:user, first_name: 'sriman', last_name: 'putla', email: 'sri@demo.com')
      FactoryBot.create(:user, first_name: 'sri', last_name: 'putla', email: 'sriman@demo.com') 
    end
    
    it "returns all users" do
      get '/api/v1/users'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end  
  end
    
  describe 'POST /users' do
    it 'create a new user' do
      expect {
        post "/api/v1/users", params: { user: {first_name: 'sai', last_name: 'putla', email: 'sai@demo.com'} }
      }.to change { User.count }.from(0).to(1)
      
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /users' do
    let!(:user) { FactoryBot.create(:user, first_name: 'sri', last_name: 'putla', email: 'sriman@demo.com') }
    
    it 'deletes a user' do
      expect {
        delete "/api/v1/users/#{user.id}"
      }.to change { User.count }.from(1).to(0)
      
      expect(response).to have_http_status(:no_content)
    end
  end
end
      
      

    
      
      
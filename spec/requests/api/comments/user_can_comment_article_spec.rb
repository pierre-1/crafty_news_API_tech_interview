RSpec.describe 'POST /api/comments', type: :request do
  let!(:articles) { create(:article) }

  let(:user) { create(:user, role: 'user') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: "application/json" }.merge!(user_credentials)
  end

  let(:commenter) { create(:user, role: 'commenter') }
  let(:commenter_credentials) { commenter.create_new_auth_token }
  let(:commenter_headers) do 
    { HTTP_ACCEPT: "application/json" }.merge!(commenter_credentials)
  end

  describe 'successfully' do
    before do
      post '/api/comments',
      params:{
        comment:{
          title: 'New Comment',
          body: "Comment body",
        },
      },
      headers: commenter_headers
    end
    
    it 'returns a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'returns a response' do
      expect(response_json['message']).to eq "Your comment has been added"
    end
    
  end
end
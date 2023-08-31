RSpec.describe 'Api::V1::SessionsController' do
  let!(:user) { create(:user) }

  describe '#create' do
    it 'success' do
      post '/api/v1/login', params: { username: user.username, password: user.password }
      expect(response.status).to eq 200
    end

    it 'failure, wrong credentials' do
      post '/api/v1/login', params: { username: user.username }
      expect(response.status).to eq 422
    end
  end

  describe '#destroy' do
    it 'failure' do
      delete '/api/v1/logout'
      expect(response.status).to eq 401
    end

    describe 'when valid token' do
      let(:session) { JWTSessions::Session.new(payload: { user_id: user.id }).login }

      it 'success' do
        delete '/api/v1/logout', params: nil, headers: { 'X-Refresh-Token': session[:refresh] }
        expect(response.status).to eq 204
      end
    end
  end
end

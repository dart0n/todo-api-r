RSpec.describe 'Api::V1::ProjectsController' do
  let(:user)         { create(:user) }
  let(:access_token) { JWTSessions::Session.new(payload: { user_id: user.id }).login[:access] }

  describe '#create' do
    before do
      post '/api/v1/projects', params: params, headers: { Authorization: access_token }
    end

    describe 'success' do
      let(:params) { attributes_for(:project) }

      include_examples 'status created'
    end

    context 'when invalid params' do
      let(:params) { { name: '' } }

      include_examples 'status unprocessable entity'
    end
  end

  describe '#index' do
    before { get '/api/v1/projects', headers: headers }

    describe 'success' do
      let(:headers) { { Authorization: access_token } }

      include_examples 'status ok'
    end

    include_examples 'status unauthorized'
  end
end

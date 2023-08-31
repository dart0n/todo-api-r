RSpec.describe 'Api::V1::UsersController' do
  describe '#create' do
    let(:attributes) { attributes_for(:user) }

    it 'success' do
      post '/api/v1/signup', params: attributes.merge({ password_confirmation: attributes[:password] })
      expect(response.status).to eq 201
    end

    it 'failure' do
      post '/api/v1/signup', params: attributes
      expect(response.status).to eq 422
    end
  end
end

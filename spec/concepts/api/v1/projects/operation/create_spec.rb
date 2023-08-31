RSpec.describe Api::V1::Projects::Operation::Create do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let(:params) { attributes_for(:project) }
  let(:user)   { create(:user) }

  it 'creates a project' do
    expect(operation).to be_success
    expect(operation[:model]).to be_persisted
  end

  context 'when invalid params' do
    let(:params) { {} }

    it do
      expect(operation).to be_failure
      expect(operation[:model]).not_to be_persisted
      expect(operation['contract.default'].errors.messages[:name].first).to match(/must be filled/)
    end
  end
end

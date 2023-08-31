RSpec.describe Api::V1::Users::Operation::Create do
  subject(:operation) { described_class.call(params: params) }

  let(:params) { attributes_for(:user, :with_confirmation) }

  it 'creates a user' do
    expect(operation).to be_success
    expect(operation[:model]).to be_persisted
  end

  context 'when invalid params' do
    let(:params) { attributes_for(:user) }

    it do
      expect(operation).to be_failure
      expect(operation[:model]).not_to be_persisted
      expect(operation['contract.default']).not_to be_nil
    end
  end
end

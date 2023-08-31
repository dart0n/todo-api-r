RSpec.describe Api::V1::Projects::Contract::Create do
  subject(:form) { described_class.new(Project.new) }

  context 'when all attributes are valid' do
    let(:valid_params) { attributes_for(:project) }

    it { expect(form.validate(valid_params)).to be_truthy }
  end

  it 'when attributes are invalid' do
    expect(form.validate({})).to be_falsey
    expect(form.errors[:name]).to include('must be filled')
  end
end

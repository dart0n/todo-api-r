RSpec.shared_examples 'status ok' do
  it { expect(response.status).to eq 200 }
end

RSpec.shared_examples 'status created' do
  it { expect(response.status).to eq 201 }
end

RSpec.shared_examples 'status unprocessable entity' do
  it { expect(response.status).to eq 422 }
end

RSpec.shared_examples 'status unauthorized' do
  context 'when user unauthorized' do
    let(:headers) { {} }

    it { expect(response.status).to eq 401 }
  end
end

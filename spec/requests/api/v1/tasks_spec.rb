RSpec.describe 'Api::V1::TasksController' do
  let(:user)         { create(:user) }
  let(:project)      { create(:project, :with_tasks, user: user) }
  let(:access_token) { JWTSessions::Session.new(payload: { user_id: user.id }).login[:access] }
  let(:headers)      { { Authorization: access_token } }

  before { project.tasks.update_all(user_id: user.id) } # rubocop:disable Rails/SkipsModelValidations

  describe '#index' do
    let(:task_one) { project.tasks.first }
    let(:task_two) { project.tasks.last }

    describe 'check statuses' do
      before { get '/api/v1/tasks', headers: headers }

      include_examples 'status unauthorized'
      include_examples 'status ok'
    end

    context 'when filtering' do
      before do
        task_one.update(is_done: true, deadline: DateTime.now)
        get '/api/v1/tasks', headers: headers, params: params
      end

      context 'by deadline' do
        let(:params) { { show: 'deadline' } }

        it { expect(response.body).to include task_one.text }
        it { expect(response.body).not_to include task_two.text }
      end

      context 'by done' do
        let(:params) { { show: 'done' } }

        it { expect(response.body).to include task_one.text }
        it { expect(response.body).not_to include task_two.text }
      end
    end

    context 'when selecting tasks for week' do
      before do
        task_one.update(deadline: DateTime.now)
        task_two.update(deadline: DateTime.now - 1.week)
        get '/api/v1/tasks', headers: headers, params: { show: 'week' }
      end

      it { expect(response.body).to include task_one.text }
      it { expect(response.body).not_to include task_two.text }
    end
  end

  describe '#create' do
    before do
      post "/api/v1/projects/#{project.id}/tasks", params: params, headers: headers
    end

    describe 'success' do
      let(:params) { attributes_for(:task) }

      include_examples 'status created'
    end

    describe 'failure' do
      let(:params) { { text: '' } }

      include_examples 'status unprocessable entity'
      include_examples 'status unauthorized'
    end
  end

  describe '#update' do
    let(:task) { project.tasks.first }

    before do
      put "/api/v1/projects/#{project.id}/tasks/#{task.id}", params: params, headers: headers
    end

    describe 'success' do
      let(:params) { attributes_for(:task) }

      include_examples 'status ok'
    end

    describe 'failure' do
      let(:params) { { text: '' } }

      include_examples 'status unprocessable entity'
      include_examples 'status unauthorized'
    end

    describe 'change deadline' do
      let(:params) { { text: task.text, deadline: deadline } }

      describe 'success' do
        let(:deadline) { DateTime.now + 1.week }

        include_examples 'status ok'
      end

      describe 'failure' do
        let(:deadline) { '' }

        include_examples 'status unprocessable entity'
      end
    end
  end
end

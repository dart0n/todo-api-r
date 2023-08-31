user = User.create(username: 'test', email: 'test@m.com', password: 'test')
FactoryBot.create(:project, :with_tasks, user: user)

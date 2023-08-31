FactoryBot.define do
  factory :task do
    text        { Faker::Name.name }
    association :project
    association :user
  end
end

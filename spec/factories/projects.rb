FactoryBot.define do
  factory :project do
    name        { Faker::Name.unique.name }
    association :user

    trait :with_tasks do
      tasks { create_list(:task, 2) }
    end
  end
end

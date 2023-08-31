FactoryBot.define do
  factory :user do
    email    { Faker::Internet.unique.email }
    username { Faker::Internet.unique.username }
    password { Faker::Internet.password }

    trait :with_confirmation do
      password_confirmation { password }
    end
  end
end

FactoryBot.define do
  factory :user do
    sequence(:email)    { |n| "user#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end

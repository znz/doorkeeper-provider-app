FactoryBot.define do
  factory :micropost do
    content { "MyString" }
    user
  end
end

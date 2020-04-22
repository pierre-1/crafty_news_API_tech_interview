FactoryBot.define do
  factory :user do
    email { "MyString" }
    password { "MyString" }
    password_confirmation { "MyString" }
    role { 'user'}
    factory :commenter do
      role {'commenter'}
    end
  end
end

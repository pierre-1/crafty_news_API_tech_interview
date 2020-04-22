FactoryBot.define do
  factory :comment do
    commenter { "MyString" }
    title {'Comment title'}
    body { "MyText" }
    association :article, factory: :article
  end
end

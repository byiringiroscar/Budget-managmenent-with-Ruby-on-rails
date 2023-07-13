FactoryBot.define do
  factory :category do
    name { "Sample Category" }
    icon { "sample_icon.png" }
    association :author, factory: :user
  end
end

# spec/factories/users.rb
FactoryBot.define do
    factory :user do
      full_name { 'Oscar' }
      email { 'user@example.com' }
      password { 'admin123' }
    end
  end
  
FactoryGirl.define do
  factory :email do
    sequence(:address) {|n| "user#{n}@test.com" }
    association :user
    trait :confirmed do
      confirmed_at 2.days.ago
    end
  end
end

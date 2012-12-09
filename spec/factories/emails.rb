FactoryGirl.define do
  factory :email do
    sequence(:address) {|n| "user#{n}@test.com" }
    association :user
    trait :confirmed do
      confirmed_at Time.now
    end
  end
end

FactoryGirl.define do
  factory :user do
    before(:create) do |user, evaluator|
      FactoryGirl.create_list(:email, 1, user: user)
    end
  end
end

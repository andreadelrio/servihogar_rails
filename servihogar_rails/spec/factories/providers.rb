FactoryGirl.define do
  factory :provider do
    sequence(:name)     { |n| "First-name#{n}" } 
    sequence(:last_name_1)     { |n| "Last-name#{n}" } 
    sequence(:last_name_2)     { |n| "Last-name#{n}" } 
    sequence(:email)         { |n| "provider#{n}@example.com" }
    dni                    "2342352"
    password                 "foobarbaz"
    password_confirmation    "foobarbaz"
    category_id           "1"
  end
end

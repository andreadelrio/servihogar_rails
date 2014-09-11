FactoryGirl.define do
  factory :provider do
    sequence(:name)     { |n| "First-name#{n}" } 
    sequence(:last_name_1)     { |n| "Last-name#{n}" } 
    sequence(:last_name_2)     { |n| "Last-name#{n}" } 
    sequence(:email)         { |n| "provider#{n}@example.com" }
    dni                    "23423528"
    phone                    "5342352"
    price                    30
    password                 "foobarbaz"
    password_confirmation    "foobarbaz"
    category_id           "1"
    locations          {|t| [t.association(:location)] }
  end  
end


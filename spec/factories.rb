require 'factory_girl'

FactoryGirl.define do
  factory :comment do
    post_id 1
    content "MyText"
  end
end

FactoryGirl.define do
  factory :post do
    title "MyString"
    text "MyText"
  end
end

FactoryGirl.define do
  factory :user do
    name 'Test_name'
    sequence(:email) {|n| "user#{n}@magma_rails.com"}
    password '123456'
    password_confirmation '123456'
  end
end

FactoryGirl.define do
   factory :user do
     sequence(:email, 100) { |n| "person#{n}@example.com" }
     password "helloworld"
     password_confirmation "helloworld"
     # confirmed_at Time.now
   end
 end

FactoryGirl.define do
   factory :todo do
     description "This is a generated todo"
     user
     created_at Time.now
   end
 end
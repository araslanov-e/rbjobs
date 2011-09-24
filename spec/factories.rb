FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
    
  factory :vacancy do
    title "Foo"
    description "Lorem ipsum"
    email
  end
end
FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
    
  factory :vacancy do
    title "Foo"
    description "Lorem ipsum"
    company "Foo Inc."
    email
    expire_at 1.week.from_now
  end
end
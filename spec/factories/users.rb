FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    name { Faker::Name.name }
    email { generate(:email) }
    password "12345678"
    password_confirmation "12345678"

    trait :admin do
      role "administrator"
    end
    factory :admin, traits: %i[admin]
  end
end

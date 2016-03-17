FactoryGirl.define do
  factory :user do
    email { Forgery(:internet).email_address }
    password { 'keyboardcat' }
    password_confirmation { 'keyboardcat' }

    # TODO: maybe remove after_stub because add_role uses database, making stubbing pointless
    trait :customer do
      callback(:after_build, :after_stub) { |user| user.add_role :customer }
    end

    trait :developer do
      callback(:after_build, :after_stub) { |user| user.add_role :developer }
    end
  end
end

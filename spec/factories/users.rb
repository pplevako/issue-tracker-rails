FactoryGirl.define do
  factory :user do
    email { Forgery(:internet).email_address }
    password { 'keyboardcat' }

    trait :customer do
      callback(:after_build, :after_stub) { |user| user.add_role :customer }
    end
  end
end

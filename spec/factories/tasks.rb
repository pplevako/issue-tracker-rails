FactoryGirl.define do
  factory :task do
    title { Forgery::LoremIpsum.title(random: true) }
    description { Forgery::LoremIpsum.paragraphs }
    status :new_task
    user
  end
end

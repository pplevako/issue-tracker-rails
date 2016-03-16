FactoryGirl.define do
  factory :task do
    title { Forgery::LoremIpsum.title(random: true) }
    description { Forgery::LoremIpsum.paragraphs }
    status 0
    user nil
  end
end

FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::Internet.url }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    year { Faker::Number.number(digits: 4) }
  end
end

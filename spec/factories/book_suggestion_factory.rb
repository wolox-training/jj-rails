FactoryBot.define do
  factory :book_suggestion do
    synopsis { Faker::Lorem.paragraph }
    price { Faker::Number.decimal(l_digits: 2) }
    author { Faker::Book.author }
    title { Faker::Book.title }
    url { Faker::Internet.url }
    editor { Faker::Book.publisher }
    year { Faker::Number.number(digits: 4) }
  end
end

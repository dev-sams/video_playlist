FactoryBot.define do
  factory :video do
    title { Faker::Movie.title }
    description { Faker::Lorem.sentence }
    views { Faker::Number.between(from: 0, to: 100000) }
    thumbnail_url { Faker::Internet.url }
    likes { Faker::Number.between(from: 0, to: 10000) }
    comments { Faker::Number.between(from: 0, to: 1000) }
  end
end
FactoryBot.define do
  factory :playlist do
    name { Faker::Music.genre }
  end
end
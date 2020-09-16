FactoryBot.define do
  factory :post do
    title      {Faker::Lorem.word}
    country_id {Faker::Number.within(range: 2..199)}
    content    {Faker::Lorem.sentence}
    ref_url    {Faker::Internet.url}
    association :user
  end
end

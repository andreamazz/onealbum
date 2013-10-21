require 'faker'

FactoryGirl.define do
  factory :album do
    title { Faker::Company.catch_phrase }
    author { Faker::Name.name }
    rating { Random.rand(CONSTANTS[:rating][:min]..CONSTANTS[:rating][:max]) }
    text { Faker::Lorem.paragraph }
    sequence(:date) { |n| Date.today + n.days }
    cover 'http://api.deezer.com/2.0/album/6227255/image'
    deezer_id '6227255'
    
    factory :invalid_album do
      title nil
    end
  end

end
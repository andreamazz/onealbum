FactoryGirl.define do
  factory :album do
    title 'Texas Flood'
    author 'Stevie Ray Vaughan and Double Trouble'
    rating 5
    text 'Amazing album'
    sequence(:date) { |n| Date.today + n.days }
    cover 'http://api.deezer.com/2.0/album/6227255/image'
    deezer_id '6227255'
  end
end
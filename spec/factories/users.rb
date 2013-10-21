require 'faker'

FactoryGirl.define do
  factory :user do
    email 'user@mail.com'
    username 'user'
    password 'password'
  end
end
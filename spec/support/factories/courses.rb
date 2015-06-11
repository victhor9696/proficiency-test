# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :courses ,class:Course do
    name "teste"
    status 1
    description " teste"
  end
end

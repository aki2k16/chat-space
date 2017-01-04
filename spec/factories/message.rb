FactoryGirl.define do

  factory :message do
    body      {Faker::Lorem.sentence}
    user_id   "1"
    group_id  "1"
  end

end

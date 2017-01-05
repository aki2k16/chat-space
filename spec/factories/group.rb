FactoryGirl.define do

  factory :group do
    group_name {Faker::Pokemon.name}
  end

end

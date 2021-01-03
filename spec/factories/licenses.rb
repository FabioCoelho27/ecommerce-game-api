FactoryBot.define do
  factory :license do
    sequence(:key) { |n| "License #{n}"}
    user { nil }
    game { nil }
  end
end

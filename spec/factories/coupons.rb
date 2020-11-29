FactoryBot.define do
  factory :coupon do
    name { "MyString" }
    code { "MyString" }
    status { 1 }
    discount_value { "9.99" }
    max_use { 1 }
    due_date { "2020-11-29 19:55:17" }
  end
end

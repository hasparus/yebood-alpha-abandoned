FactoryGirl.define do
  factory :post do
    user   # implicit
    topic  # associations
    content 'a' * 20
  end
end

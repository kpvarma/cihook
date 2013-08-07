# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :repository do
    repository_id "MyString"
    name "MyString"
    url "MyString"
    description "MyText"
    owner_id 1
    private false
    repository_created_at "2013-08-07 19:07:14"
    repository_pushed_at "2013-08-07 19:07:14"
    pusher_id 1
  end
end

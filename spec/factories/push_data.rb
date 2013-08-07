# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :push_datum, :class => 'PushData' do
    ref "MyString"
    after "MyString"
    before "MyString"
    created false
    deleted false
    forced false
    compare "MyString"
    head_commit_id 1
  end
end

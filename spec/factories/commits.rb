# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :commit do
    commit_id "MyString"
    message "MyString"
    distinct false
    commit_timestamp "2013-08-07 19:02:57"
    commit_url "MyString"
    author_id 1
    committer_id 1
    added "MyText"
    removed "MyText"
    modified "MyText"
    head_commit false
  end
end

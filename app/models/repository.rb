class Repository < ActiveRecord::Base
  attr_accessible :description, :name, :owner_id, :private, :pusher_id, :repository_created_at, :repository_id, :repository_pushed_at, :url
end

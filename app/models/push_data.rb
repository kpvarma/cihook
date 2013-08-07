class PushData < ActiveRecord::Base
  attr_accessible :after, :before, :compare, :created, :deleted, :forced, :head_commit_id, :ref
end

class Commit < ActiveRecord::Base
  attr_accessible :added, :author_id, :commit_id, :commit_timestamp, :commit_url, :committer_id, :distinct, :head_commit, :message, :modified, :removed
end

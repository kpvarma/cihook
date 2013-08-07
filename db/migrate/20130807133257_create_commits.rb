class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :commit_id
      t.string :message
      t.boolean :distinct
      t.timestamp :commit_timestamp
      t.string :commit_url
      t.integer :author_id
      t.integer :committer_id
      t.text :added
      t.text :removed
      t.text :modified
      t.boolean :head_commit

      t.timestamps
    end
  end
end

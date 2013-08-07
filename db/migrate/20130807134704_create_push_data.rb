class CreatePushData < ActiveRecord::Migration
  def change
    create_table :push_data do |t|
      t.string :ref
      t.string :after
      t.string :before
      t.boolean :created
      t.boolean :deleted
      t.boolean :forced
      t.string :compare
      t.integer :head_commit_id

      t.timestamps
    end
  end
end

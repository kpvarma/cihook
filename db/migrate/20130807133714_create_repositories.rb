class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :repository_id
      t.string :name
      t.string :url
      t.text :description
      t.integer :owner_id
      t.boolean :private
      t.timestamp :repository_created_at
      t.timestamp :repository_pushed_at
      t.integer :pusher_id

      t.timestamps
    end
  end
end

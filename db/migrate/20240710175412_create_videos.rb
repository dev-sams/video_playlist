class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :title, index: true
      t.string :video_id
      t.integer :views
      t.string :thumbnail_url
      t.text :description
      t.integer :likes
      t.integer :comments
      t.timestamps
    end

    add_index :videos, :video_id, unique: true
  end
end

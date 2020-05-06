class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :creator, foreign_key: { to_table: :users }, index: true, null: false
      t.string :title
      t.text :body
      t.integer :likes_count, default: 0
      t.timestamps
    end
  end
end

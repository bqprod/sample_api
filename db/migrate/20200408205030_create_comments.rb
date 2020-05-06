class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.references :post, foreign_key: true, null: false, index: true
      t.string :message
      t.timestamps
    end
  end
end

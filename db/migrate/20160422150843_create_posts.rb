class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.string :image
      t.string :type
      t.decimal :price
      t.references :user

      t.timestamps null: false
    end
  end
end

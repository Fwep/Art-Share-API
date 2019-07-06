class CreateCommentsAndAddForeignKeyConstraints < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false
      t.integer :artwork_id, null: false
      t.foreign_key :artworks, on_delete: :cascade
      
      t.timestamps
    end
    add_foreign_key :comments, :users, column: :author_id, on_delete: :cascade
    add_foreign_key :artworks, :users, column: :artist_id, on_delete: :cascade
    add_foreign_key :artwork_shares, :users, column: :viewer_id, on_delete: :cascade
    add_foreign_key :artwork_shares, :artworks, on_delete: :cascade

    add_index :comments, :author_id
    add_index :comments, :artwork_id
  end
end

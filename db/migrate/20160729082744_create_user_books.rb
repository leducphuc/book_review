class CreateUserBooks < ActiveRecord::Migration
  def change
    create_table :user_books do |t|
      t.boolean :is_favorite
      t.integer :reading_status
      t.integer :rate_score
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

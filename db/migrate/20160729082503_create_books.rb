class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :number_of_pages
      t.datetime :publish_date
      t.float :rating
      t.integer :favorites, default: 0
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

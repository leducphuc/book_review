class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.datetime :publish_date
      t.string :author
      t.boolean :is_accepted
      t.references :user, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end

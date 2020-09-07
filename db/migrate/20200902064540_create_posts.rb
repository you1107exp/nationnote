class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.integer :country_id, null: false
      t.string :content, null: false
      t.string :ref_url
      t.string :ref_img
      t.string :nickname, null: false
      t.timestamps
    end
  end
end

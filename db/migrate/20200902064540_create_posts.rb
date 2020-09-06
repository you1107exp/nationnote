class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :country
      t.string :content
      t.string :ref_url
      t.string :ref_img
      t.string :nickname
      t.timestamps
    end
  end
end

class CreateCountryPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :country_posts do |t|
      t.integer :post_id, foreign_key: true
      t.timestamps
    end
  end
end

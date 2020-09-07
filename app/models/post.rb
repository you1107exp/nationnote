class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :country
  belongs_to :user

  validates :title, :country, :content, presence: true
  validates :country_id, numericality: { other_than: 1 }
end

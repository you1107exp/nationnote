class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :country
  belongs_to :user
  has_one_attached :ref_img

  with_options presence: true do
    validates :country
    validates :title, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
  end
  validates :country_id, numericality: { other_than: 1 }
end

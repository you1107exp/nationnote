class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :country
  belongs_to :user
  has_one :country
  has_one_attached :ref_img

  with_options presence: true do
    validates :country
    validates :title, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
  end
  validates :country_id, numericality: { other_than: 1 }

  def self.search(search)
    if search != ""
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.includes(:user).order("created_at DESC")
    end
  end
end

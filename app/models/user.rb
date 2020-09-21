class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  with_options presence: true do

    VALID_NICKNAME_REGEX = /\A[a-zA-Z0-9]{,20}+\z/
    validates :nickname, format: { with: VALID_NICKNAME_REGEX }, length: { maximum: 20 }

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
    validates :email, format: { with: VALID_EMAIL_REGEX }

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{6,}+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 6 }

  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.nickname = "guest"
      user.password = SecureRandom.alphanumeric(10)
    end
  end
end

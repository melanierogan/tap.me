class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }

  validates :username,
            presence: true,
            length: { minimum: 2, maximum: 15},
            uniqueness: true

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }

  validates :password,
            presence: true,
            length: { minimum: 6 }

  has_secure_password

end

class User < ApplicationRecord
  belongs_to :house
  before_save {self.email = email.downcase}

  validates :firstName, presence: true,
                      length: {minimum: 2, maximum: 15}
  validates :lastName, presence: true,
                      length: {minimum: 2, maximum: 15}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                     uniqueness: { case_sensitive: false },
                     length: {maximum: 105},
                     format: { with: VALID_EMAIL_REGEX }


  has_secure_password

end

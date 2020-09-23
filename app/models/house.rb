class House < ApplicationRecord
  validates :owner, presence: true
  has_many :users
  validates :name, presence: true,
                      length: {minimum: 5, maximum: 20}
end

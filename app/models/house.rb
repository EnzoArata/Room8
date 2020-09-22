class House < ApplicationRecord
  validates :owner, presence: true
  has_many :users
end

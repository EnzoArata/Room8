class House < ApplicationRecord
  validates :owner, presence: true
  has_many :users
  has_many :tasks
  validates :name, presence: true,
                      length: {minimum: 5, maximum: 20}
end

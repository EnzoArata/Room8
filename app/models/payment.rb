class Payment < ApplicationRecord
  belongs_to :house
  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :amount, presence: true
  validates :startDate, presence: true
  validates :dueDate, presence: true
  validates :assignedUser, presence: true

end

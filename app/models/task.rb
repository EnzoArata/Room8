class Task < ApplicationRecord
  belongs_to :house
  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :description, presence: true, length: {minimum: 6, maximum: 100}
  validates :startDate, presence: true
  validates :dueDate, presence: true
  validates :assignedUser, presence: true

end

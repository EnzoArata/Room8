class House < ApplicationRecord
  validates :owner, presence: true

end

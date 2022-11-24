class Review < ApplicationRecord
  belongs_to :laptop
  validates :review, numericality: { only_integer: true }
  validates :review, inclusion: { in: 0..5 }
end

class Laptop < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  has_many :reviews
  validates :hard_drive, :ram, :operating_system, :screen_size, :year_built, presence: true
end

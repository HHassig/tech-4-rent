class Laptop < ApplicationRecord
  after_initialize :set_defaults
  belongs_to :user
  has_one_attached :photo
  has_many :reviews
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def set_defaults
    self.average_rating ||= 0.0
  end
end

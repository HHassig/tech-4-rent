class Laptop < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  # def self.search_by(search_term)
  #   where("title LIKE :search_term", search_term: "%#{search_term.downcase}%")
  # end
end

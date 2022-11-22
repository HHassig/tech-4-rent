class Laptop < ApplicationRecord
  belongs_to :user

  def self.search_by(search_term)
    where("Lower(name) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end
end

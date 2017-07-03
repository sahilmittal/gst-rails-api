class Category < ApplicationRecord
  has_many :goods
  validates :name, presence: true
end

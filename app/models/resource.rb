class Resource < ApplicationRecord
  belongs_to :resource_library
  validates :name, presence: true
end

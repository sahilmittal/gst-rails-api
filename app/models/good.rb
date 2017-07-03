class Good < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :gst, presence: true
end

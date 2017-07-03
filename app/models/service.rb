class Service < ApplicationRecord
  validates :name, presence: true
  validates :gst, presence: true
end

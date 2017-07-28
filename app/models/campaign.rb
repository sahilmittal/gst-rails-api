class Campaign < ApplicationRecord
  validates :source, presence: true
end

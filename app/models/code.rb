class Code < ApplicationRecord
  validates :name, presence: true
  validates :code_type, presence: true
end

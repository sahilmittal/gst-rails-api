class Feedback < ApplicationRecord
  scope :user_email, -> (user_email) { where user_email: user_email }
  scope :resolved, -> (resolved) { where resolved: resolved }
  validates :message, presence: true
end
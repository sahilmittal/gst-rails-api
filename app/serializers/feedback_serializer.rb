class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :message, :user_email, :created_at, :resolved
end
class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :source, :medium, :term, :content, :name, :created_at
end
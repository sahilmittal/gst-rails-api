class GoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :gst
  belongs_to :category
 
  class CategorySerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
class GoodSerializer < ActiveModel::Serializer
  attributes :name, :gst
  belongs_to :category
 
  class CategorySerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
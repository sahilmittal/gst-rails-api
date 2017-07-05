class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :resource_library
 
  class ResourceLibrarySerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
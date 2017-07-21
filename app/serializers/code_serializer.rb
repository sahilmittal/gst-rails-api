class CodeSerializer < ActiveModel::Serializer
  attributes :name, :code, :code_type
end
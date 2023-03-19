class NodeSerializer < ActiveModel::Serializer
  attributes :id, :name, :ancestry, :category
end

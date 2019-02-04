class SadnewSerializer < ActiveModel::Serializer
  attributes :id, :news_src, :title, :description
end

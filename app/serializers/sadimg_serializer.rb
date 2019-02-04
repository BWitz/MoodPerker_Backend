class SadimgSerializer < ActiveModel::Serializer
  attributes :id, :img_url, :user_id
  belongs_to :user
end

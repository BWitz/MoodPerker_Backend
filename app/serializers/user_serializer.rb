class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  # has_many :happyimgs
  # has_many :sadimgs
  # has_many :contentimgs
end

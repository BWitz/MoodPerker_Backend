class User < ApplicationRecord
  has_many :happyimgs, dependent: :destroy
  has_many :sadimgs, dependent: :destroy
  has_many :contentimgs, dependent: :destroy
  has_many :boredimgs, dependent: :destroy
end

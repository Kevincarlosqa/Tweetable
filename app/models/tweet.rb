class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :replied_to, class_name: "Tweet", optional: true
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
end

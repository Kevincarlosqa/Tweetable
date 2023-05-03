class Tweet < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :replied_to, counter_cache: :replies_count, class_name: "Tweet", optional: true
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :replies, class_name: "Tweet",
                     foreign_key: "replied_to_id",
                     dependent: :nullify,
                     inverse_of: "replied_to"

  # Validations
  validates :body, presence: true, length: { maximum: 140 }
end

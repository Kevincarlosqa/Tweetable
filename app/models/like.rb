class Like < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :tweet, counter_cache: :likes_count

  # Validations
  validates :tweet, uniqueness: { scope: :user }
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Associations
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_many :tweets, through: :likes

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  enum :role, { member: 0, admin: 1 }
end

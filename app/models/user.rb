class User < ApplicationRecord
  has_many :requests
  has_many :itineraries, through: :requests

  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true 
  validates :last_name, presence: true
end

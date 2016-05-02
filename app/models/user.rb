class User < ActiveRecord::Base
  # validates :password, presence: true, on: :create
  has_secure_password
  has_many :articles
  has_many :comments
end

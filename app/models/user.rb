class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end


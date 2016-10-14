class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 8}
end

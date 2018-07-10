class User < ActiveRecord::Base
  validates :username, presence: true, length: { minimum: 4, maximum: 30 }
  validates :email, presence: true, length: { minimum: 10, maximum: 4000 }
end
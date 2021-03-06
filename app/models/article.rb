class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 4, maximum: 30 }
  validates :description, presence: true, length: { minimum: 10, maximum: 4000 }
  validates :user_id, presence: true
end
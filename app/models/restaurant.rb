class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :address, presence: true 
  validates :name, presence: true 
  validates :category, presence: true, inclusion: { in: %w(chinese italian japanese french belgian) }
end

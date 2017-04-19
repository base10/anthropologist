class Repository < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true
end

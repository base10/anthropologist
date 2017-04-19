class Repository < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true

  has_many :commits, dependent: :destroy
end

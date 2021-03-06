class Author < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_and_belongs_to_many :commits
end

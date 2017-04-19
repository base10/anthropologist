class Commit < ApplicationRecord
  validates :reference, presence: true, uniqueness: true
  validates :repository_id, presence: true

  belongs_to :repository
  has_and_belongs_to_many :authors
end

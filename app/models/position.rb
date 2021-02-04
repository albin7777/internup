class Position < ApplicationRecord
  belongs_to :user
  has_many :submissions
  validates :title, presence: true
  validates :description, presence: true
  validates :salary, presence: true
  validates :duration, presence: true

  include PgSearch::Model
  pg_search_scope :search,
    against: [:title, :description],
    using: {
      tsearch: { prefix: true }
    }
end

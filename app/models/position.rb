class Position < ApplicationRecord
  belongs_to :user
  has_many :submissions
  validates :title, presence: true
  validates :description, presence: true
  validates :salary, presence: true
  validates :duration, presence: true
end

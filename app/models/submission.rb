class Submission < ApplicationRecord
  STATUS = ['pending', 'offer received', 'rejected', 'accepted']
  belongs_to :user
  belongs_to :position
  validates :status, inclusion: { in: STATUS, message: "Please select the status" }
  has_one_attached :cv
end

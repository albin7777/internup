class Submission < ApplicationRecord
  STATUS = ['pending', 'offer received', 'rejected']
  belongs_to :user
  belongs_to :position
  validates :status, inclusion: { in: STATUS, message: "Please select the status" }
end

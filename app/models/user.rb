class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLES = ['business', 'intern']
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :submissions, dependent: :destroy # bookings as a client
  has_many :positions, dependent: :destroy
  has_many :submissions_as_owner, through: :positions, source: :submissions
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :role, presence: true
  validates :description, presence: true
  validates :role, inclusion: { in: ROLES, message: "Please select business or intern"}
end

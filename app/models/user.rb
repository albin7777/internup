class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  TYPE = ['business', 'intern']
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :submissions # bookings as a client
  has_many :positions
  has_many :submissions_as_owner, through: :positions, source: :submissions
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :type, presence: true
  validates :description, presence: true
  validates :type, inclusion: { in: TYPE, message: "Please select business or intern"}
end

class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  has_many :followers, class_name: 'Follow'
  has_many :customers, through: :followers
  has_many :notifications, dependent: :destroy
  belongs_to :hospital, optional: true

  enum approved_status: { unapproved: 1, approved: 2, denied: 3 }
  
  
end
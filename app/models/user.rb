class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :office
  accepts_nested_attributes_for :office
  has_many :calendars, dependent: :destroy
  has_many :events, dependent: :destroy
end

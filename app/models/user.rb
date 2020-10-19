class User < ApplicationRecord
  rolify
  
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :office
  accepts_nested_attributes_for :office
  has_many :calendars, dependent: :destroy
  has_many :events, dependent: :destroy

  after_create :assign_default_role 

  def assign_default_role
    if office.users.count == 1
      self.add_role(:admin) if self.roles.blank?
    else 
      self.add_role(:staff) 

  end 
end   
end

class Appointment < ApplicationRecord
  belongs_to :office
  belongs_to :citizen
end

class Grievance < ApplicationRecord
  belongs_to :office
  has_many :pipelines, dependent: :destroy
end

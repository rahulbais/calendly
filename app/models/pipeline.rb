class Pipeline < ApplicationRecord
  belongs_to :grievance
  has_many :items, dependent: :destroy
end

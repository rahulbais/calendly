class Office < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :grievances, dependent: :destroy
end

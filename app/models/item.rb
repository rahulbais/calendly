class Item < ApplicationRecord
  belongs_to :pipeline
  has_rich_text :content
end

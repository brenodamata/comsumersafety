class Drug < ApplicationRecord
  belongs_to :category, optional: true
  has_many :recalls, as: :recallable
end

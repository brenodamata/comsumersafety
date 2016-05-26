class Recall < ApplicationRecord
  belongs_to :recallable, polymorphic: true
end

class Game < ApplicationRecord
  belongs_to :console
  belongs_to :genre
  belongs_to :productType
end

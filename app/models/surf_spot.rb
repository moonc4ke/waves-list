class SurfSpot < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :spot_change_proposals, dependent: :destroy
end

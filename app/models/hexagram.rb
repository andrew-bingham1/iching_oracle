class Hexagram < ApplicationRecord
  validates :title, presence: true
  validates :oracle, presence: true
  validates :summary, presence: true
  validates :judgment, presence: true
  validates :judgment_sum, presence: true
  validates :image, presence: true
  validates :image_sum, presence: true
end

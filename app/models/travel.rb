class Travel < ApplicationRecord
  belongs_to :user

  validates :departure_point, presence: true,  length: {minimum: 3}
  validates :destination, presence: true,  length: {minimum: 3}
  validates :price, presence: true
  validates :date, presence: true, comparison: { greater_than: Date.current }
end

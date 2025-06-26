class Conversion < ApplicationRecord
  validates :from, presence: true, length: { is: 3 }, format: { with: /\A[A-Z]{3}\z/, message: "must be a valid currency code" }
  validates :to, presence: true, length: { is: 3 }, format: { with: /\A[A-Z]{3}\z/, message: "must be a valid currency code" }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :result, presence: true, numericality: { greater_than: 0 }
end

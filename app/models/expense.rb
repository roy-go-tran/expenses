class Expense < ApplicationRecord
  validates :category, presence: true

  scope :by_date_range, ->(start_date, end_date) { where("Date(created_at) >= ? AND Date(created_at) < ?", start_date, end_date) }
end

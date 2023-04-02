class Promotion < ApplicationRecord
    validates :start_date, :end_date, presence: true
    validates :priority_level, numericality: { less_than: 11, greater_than: 0 }, if: :priority_level
end

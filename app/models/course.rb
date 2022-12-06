class Course < ApplicationRecord
    has_many :golfers

    def golfers_count
        golfers.count
    end

    def self.newest_first
        Course.order(created_at: :desc)
    end
end
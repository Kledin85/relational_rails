class Golfer < ApplicationRecord
  belongs_to :course

  def self.limit_by(params)
    where(params)
  end
end
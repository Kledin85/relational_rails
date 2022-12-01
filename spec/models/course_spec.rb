require 'rails_helper'

RSpec.describe Course do
  it {have_many :golfers}
end
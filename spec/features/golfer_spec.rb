require 'rails_helper' 

RSpec.describe 'golfer', type: :feature do
#   User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)
  let!(:golfer_1) { Golfer.create!(name: "Kyle", adult: true, tee_time: Time.now)}
  let!(:golfer_2) { Golfer.create!(name: "Wes", adult: true, tee_time: Time.now)}
  it 'index' do
    visit '/golfers'

    expect(page).to have_content(golfer_1.name)
    expect(page).to have_content(golfer_2.name)
    expect(page).to have_content(golfer_1.adult)
    expect(page).to have_content(golfer_2.adult)
    expect(page).to have_content(golfer_1.tee_time)
    expect(page).to have_content(golfer_2.tee_time)
  end
end
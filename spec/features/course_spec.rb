require 'rails_helper'

RSpec.describe 'course', type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  let!(:course_1)  { Course.create!(name: "Kyle Course", city: "Ankeny", tee_times: 45) }
  let!(:course_2)  { Course.create!(name: "Not Kyle Course", city: "Des Moines", tee_times: 50) }

  it 'index' do
    visit "/courses"
   
    expect(page).to have_content(course_1.name)
    expect(page).to have_content(course_2.name)
  end

  it 'show' do
    visit "/courses/#{course_1.id}"

    expect(page).to have_content(course_1.name)
    expect(page).to_not have_content(course_2.name)
  end
end
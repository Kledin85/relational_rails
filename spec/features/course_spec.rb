require 'rails_helper'

RSpec.describe 'course', type: :feature do
  
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  let!(:course_1)  { Course.create!(name: "Kyles Course", city: "Ankeny", tee_times: 45) }
  let!(:course_2)  { Course.create!(name: "Not Kyles Course", city: "Des Moines", tee_times: 50) }
  let!(:golfer_1)  { course_1.golfers.create!(name: "Kyle", adult: true, tee_time: Time.now) }
  let!(:golfer_2)  { course_1.golfers.create!(name: "wes", adult: true, tee_time: Time.now) }
  let!(:golfer_3)  { course_2.golfers.create!(name: "John", adult: true, tee_time: Time.now) }

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

#   As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)
  it 'shows all golfers names and attributes for a course' do
    visit "/courses/#{course_1.id}/golfers"

    expect(page).to have_content(golfer_1.name)
    expect(page).to have_content(golfer_1.adult)
    expect(page).to have_content(golfer_1.tee_time)
    expect(page).to have_content(golfer_1.course_id)
    expect(page).to have_content(golfer_2.name)
    expect(page).to have_content(golfer_2.adult)
    expect(page).to have_content(golfer_2.tee_time)
    expect(page).to have_content(golfer_2.course_id)
    expect(page).to_not have_content(golfer_3.name)
  end

#   As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
  it 'shows the created at time next to the course name' do
    visit '/courses'

    expect(page).to have_content(course_1.created_at)
  end

  it 'shows most recently created first' do
    course_2.created_at = course_2.created_at + 10 * 6
    course_2.save
    visit '/courses'

    expected = course_2.created_at > course_1.created_at

    expect(expected).to be true
  end

#   As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

  it 'shows the number of golfers at a course' do
    visit "/courses/#{course_1.id}"

    expect(page).to have_content(course_1.golfers.length)
    expect(page).to_not have_content(course_2.golfers.length)
  end

#   As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
describe 'link to parent index' do
  it 'courses page has a link on the courses page' do
    visit '/courses'
    click_link('Courses')
    
    expect(current_path).to eq('/courses')
  end

  it 'courses/course.id page has a link on the courses page' do
    visit "/courses/#{course_1.id}"
    click_link('Courses')
    
    expect(current_path).to eq('/courses')
  end

  it 'golfers page has a link on the courses page' do
    visit "/golfers"
    click_link('Courses')
    
    expect(current_path).to eq('/courses')
  end

  it 'golfers/golfer_id page has a link on the courses page' do
    visit "/golfers/#{golfer_1.id}"
    click_link('Courses')
    
    expect(current_path).to eq('/courses')
  end

  it 'courses/course_id/golfers page has a link on the courses page' do
    visit "/courses/#{course_1.id}/golfers"
    click_link('Courses')
    
    expect(current_path).to eq('/courses')
  end
  
end

# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  it 'links to the child table name' do
    visit "/courses/#{course_1.id}"
    click_link('Course Golfers')

    expect(current_path).to eq("/courses/#{course_1.id}/golfers")

  end

#   User Story 17, Parent Update From Parent Index Page 

# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to edit that parent's info
# When I click the link
# I should be taken to that parent's edit page where I can update its information just like in User Story 12

it 'has a link next to every parent to edit the index' do
  visit "/courses"

  click_link("edit #{course_1.name}")

  expect(current_path).to eq("/courses/#{course_1.id}/edit")
end
end
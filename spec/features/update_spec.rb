require 'rails_helper'

RSpec.describe 'The Course Update' do
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to update the parent "Update Parent"
  # When I click the link "Update Parent"
  # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info
  let!(:course_1)  { Course.create!(name: "Kyles Course", city: "Ankeny", tee_times: 45) }
  let!(:course_2)  { Course.create!(name: "Not Kyles Course", city: "Des Moines", tee_times: 50) }

  it 'course update' do 
    # binding.pry
    visit "/courses/#{course_1.id}"

    click_button ("Update #{course_1.name}")

    expect(current_path).to eq("/courses/#{course_1.id}/edit")

  end
  it 'can update a course' do
    visit "/courses/#{course_1.id}"

    expect(page).to have_content course_1.name = "Kyles Course"
    
    click_button ("Update #{course_1.name}")
    
    fill_in('name', with: "Still Kyles Course")
    fill_in('city', with: "Ankeny")
    fill_in('tee_times', with: 40)
    click_button 'Update Course'
    
    expect(current_path).to eq("/courses")
    expect(page).to have_content course_1.name = "Still Kyles Course"    
  end
 
end   
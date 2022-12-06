require 'rails_helper'

RSpec.describe 'The Course Creation' do
#   As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

  it 'links to a new page from courses index' do
   visit "/courses"
    click_link('Create Course')

    expect(current_path).to eq('/courses/new')
  end

  it 'can create a new course' do
    visit "courses/new"

    fill_in('Name', with: "AGC")
    click_button('Create Course')

    expect(current_path).to eq("/courses")
    expect(page).to have_content("AGC")
  end
end
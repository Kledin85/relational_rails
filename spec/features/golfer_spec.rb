require 'rails_helper' 

RSpec.describe 'golfer', type: :feature do
#   User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)
  let!(:course_1) {Course.create!(name: "Kyles Course", city: "Ankeny", tee_times: 45)}
  let!(:golfer_1) {course_1.golfers.create!(name: "Kyle", adult: true, tee_time: Time.now)}
  let!(:golfer_2) {course_1.golfers.create!(name: "Wes", adult: true, tee_time: Time.now)}
  it 'index' do
    visit '/golfers'

    expect(page).to have_content(golfer_1.name)
    expect(page).to have_content(golfer_2.name)
    expect(page).to have_content(golfer_1.adult)
    expect(page).to have_content(golfer_2.adult)
    expect(page).to have_content(golfer_1.tee_time)
    expect(page).to have_content(golfer_2.tee_time)
    expect(page).to have_content(golfer_1.course_id)
    expect(page).to have_content(golfer_2.course_id)
  end

#   User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)
  it 'show' do
    visit "/golfers/#{golfer_1.id}"

    expect(page).to have_content(golfer_1.name)
    expect(page).to have_content(golfer_1.adult)
    expect(page).to have_content(golfer_1.tee_time)
    expect(page).to have_content(golfer_1.course_id)
  end

#   As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
  describe 'link to child index' do
    it 'courses page has a link on the golfers page' do
      visit '/courses'
      click_link('Golfers')
      
      expect(current_path).to eq('/golfers')
    end

    it 'courses/course.id page has a link on the golfers page' do
      visit "/courses/#{course_1.id}"
      click_link('Golfers')
      
      expect(current_path).to eq('/golfers')
    end

    it 'golfers page has a link on the golfers page' do
      visit "/golfers"
      click_link('Golfers')
      
      expect(current_path).to eq('/golfers')
    end

    it 'golfers/golfer_id page has a link on the golfers page' do
      visit "/golfers/#{golfer_1.id}"
      click_link('Golfers')
      
      expect(current_path).to eq('/golfers')
    end

    it 'courses/course_id/golfers page has a link on the golfers page' do
      visit "/courses/#{course_1.id}/golfers"
      click_link('Golfers')
      
      expect(current_path).to eq('/golfers')
    end
    
  end
  describe 'story 13' do
    #  `User Story 13, Parent Child Creation 
    
    #   As a visitor
    #   When I visit a Parent Children Index page
    #   Then I see a link to add a new adoptable child for that parent "Create Child"
    #   When I click the link
    #   I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
    #   When I fill in the form with the child's attributes:
    #   And I click the button "Create Child"
    #   Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
    #   a new child object/row is created for that parent,
    #   and I am redirected to the Parent Childs Index page where I can see the new child listed
    
    it 'has a link to create a new golfer' do
      visit "/courses/#{course_1.id}/golfers"
    
        click_link 'Create Golfer'
    
        expect(current_path).to eq("/courses/#{course_1.id}/golfers/new")
       end

    it 'can create a new golfer' do
      visit "/courses/#{course_1.id}/golfers/new"

      fill_in('course_name', with: 'Kyles Course')
      fill_in('name', with: 'Tiger Woods')
      fill_in('city', with: 'Cypress')
      fill_in('adult', with: 'true')
      fill_in('tee_time', with: Time.now)
      click_button('Create Golfer')

      expect(page).to have_content('Tiger Woods')
    end
  end

  describe 'create golfer' do
    it 'can click the new golfer link and create golfer' do 
      visit "/golfers"

      click_link 'New Golfer'

      expect(current_path).to eq("/golfers/new")

      fill_in('course_name', with: 'Kyles Course')
      fill_in('name', with: "Tiger Woods")
      click_button('Create Golfer')

      expect(page).to have_content('Tiger Woods')
    end
  end
end
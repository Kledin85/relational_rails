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
  let!(:golfer_3) {course_1.golfers.create!(name: "Joe", adult: false, tee_time: Time.now)}
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
      save_and_open_page
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
  describe 'story 14' do 
#     User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
    it 'has a link to update a golfer' do
      visit "/golfers/#{golfer_1.id}"

      click_link ("Update Golfer")

      expect(current_path).to eq("/golfers/#{golfer_1.id}/edit")
    end

    it 'has a form to edit a golfer' do
      visit "/golfers/#{golfer_1.id}/edit"

      fill_in('name', with: "Kyle Ledin")
      click_button('Update Golfer')

      expect(current_path).to eq("/golfers/#{golfer_1.id}")
    end
  end

  describe 'story 15' do
#     User Story 15, Child Index only shows `true` Records 

# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`
    it 'only shows records where the boolean column is true' do
      visit '/golfers'


      expect(page).to have_content(golfer_1.name)
      expect(page).to have_content(golfer_2.name)
      expect(page).to_not have_content(golfer_3.name)
    end
  end

  describe 'story 16' do
#User Story 16, Sort Parent's Children in Alphabetical Order by name 

# As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
      it 'has a link to sort alphabetically' do
        visit "/courses/#{course_1.id}/golfers"
        golfers = Golfer.all

        expect(page).to have_content('Sort Alphabetically')

        expect(golfers.order(:name)).to eq([golfer_3,golfer_1,golfer_2])
      end
  end

  describe 'story 18' do 
#     User Story 18, Child Update From Childs Index Page 

# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to edit that child's info
# When I click the link
# I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
    it 'has a link next to every child to edit its info on the childs index page' do
     visit "/golfers"

      click_link("Edit #{golfer_1.name}")

      expect(current_path).to eq("/golfers/#{golfer_1.id}/edit")
   end
    it 'has a link next to every child to edit its info on the parent child index page' do
     visit "/courses/#{course_1.id}/golfers"

      click_link("Edit #{golfer_1.name}")

      expect(current_path).to eq("/golfers/#{golfer_1.id}/edit")
    end
  end

  describe 'story 19' do
#     User Story 20, Child Delete 

# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child
    it 'can delete a child' do 
      visit "/golfers/#{golfer_1.id}"
      click_link("Delete #{golfer_1.name}")
      
      expect(current_path).to eq("/golfers")
      expect(page).to_not have_content("Kyle")
    end
  end
end
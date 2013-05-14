require 'spec_helper'

describe "Users" do 

  before do 
    @user = User.create :name => 'tester', :password => '1234', :password_confirmation => '1234'
  end

  describe "GET /users" do
    it "Displays some users" do 
      visit users_path
      page.should have_content 'tester'
    end

    it "Creates new user" do
      visit users_path
      click_link 'Add new User'

      fill_in 'Name', :with => 'tester1'
      fill_in 'Password', :with => '2345'
      fill_in 'Confirm Password', :with => '2345'

      click_button 'Create User'

      current_path.should == users_path
      page.should have_content 'tester1'
    end
  end

  describe "PUT /users" do 
    it "Edits a user" do 

      visit users_path

      click_link 'Edit'

      current_path.should == edit_user_path(@user)

      find_field('Name').value.should == 'tester'
      fill_in 'Name', :with => 'Updated tester'
      fill_in 'Password', :with => '1234'
      fill_in 'Confirm Password', :with => '1234'

      click_button 'Update User'

      current_path.should == users_path
      page.should have_content 'Updated tester'
    end

    it "Should not allow an empty field when updating" do  
      visit users_path
      click_link 'Edit'

      fill_in 'Name', :with => ''

      click_button 'Update User'

      current_path.should == user_path(@user)

      page.should have_content 'error'
    end
  end
end


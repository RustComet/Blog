require 'spec_helper'

describe "Sessions" do 

  describe "GET /sessions" do 
    it "Logs In" do 
      visit posts_path

      page.should have_no_content 'Edit'
      page.should have_no_content 'Delete'

      page.should have_content 'Login'

      click_link "Login"

      current_path.should == login_path

      fill_in "Name", :with => "spectester"
      fill_in "Password", :with => "1234"
      click_button "Login"

      current_path.should == posts_path

      page.should have_content 'Edit'
    end
  end
end



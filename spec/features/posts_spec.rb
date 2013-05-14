require 'spec_helper'

describe "Posts" do

  before do
    @post = Post.create :title => 'First Post', :body => 'Hello World'
  end

  describe "GET /posts" do
    it "Display some posts" do 
      visit posts_path
      page.should have_content 'First Post'
    end

    it "Creates a new Post" do
      visit posts_path
      fill_in 'Title', :with => 'My Second Post'
      fill_in 'Body', :with => 'This is my second test post'
      click_button 'Create Post'

      current_path.should == posts_path
      page.should have_content 'My Second Post'
    end
  end

  describe "PUT /posts" do
    it "Edits a post" do
      visit posts_path
      click_link "Edit"

      current_path.should == edit_post_path(@post)

      find_field('Title').value.should == 'First Post'

      fill_in 'Title', :with => 'Updated Post'

      click_button 'Update Post'

      current_path.should == posts_path

      page.should have_content 'Updated Post'
    end

    it "Shows a post when clicked" do
      visit posts_path

      click_link "First Post"

      page.should have_content 'Hello World'

      click_link 'Back to Posts'

      current_path.should == posts_path
    end

    it "Should not update an empty post" do
      visit posts_path
      click_link 'Edit'
      fill_in 'Title', :with => ''
      click_button 'Update Post'

      current_path.should == edit_post_path(@post)
      page.should have_content 'Cannot have an empty post'
    end
  end

  describe "DELETE /posts" do 
    it "Deletes a post" do
      visit posts_path
      find("#post_#{@post.id}").click_link 'Delete'
      page.should have_content 'Post was successfully deleted'

      page.should have_no_content 'First Post'
    end
  end
end

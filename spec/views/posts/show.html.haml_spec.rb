require 'spec_helper'

describe "posts/show" do
  before(:each) do
    @user = stub_model(User, :id => 1)
    @post = assign(:post, stub_model(Post,
      :id => 1,
      :title => "Title",
      :text => "MyText",
      :user_id => 1
    ))
    @comment = stub_model(Comment, :post_id => 1, :content => 'Test Comemnt', :user_name => 'Test Name')
    render
  end

  it "renders attributes in <p>" do
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
  
  it "it should render a new form comment" do 
    rendered.should have_selector('form#new_comment')
  end
  
  it "should not show the buttons of edit and delete" do 
    view.stub(:current_user).and_return(nil)
    assert_select ".btn", :count => 1
    rendered.should_not have_selector('.btn btn-danger')
  end
end

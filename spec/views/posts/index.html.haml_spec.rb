require 'spec_helper'

describe "posts/index" do
  before(:each) do
    @user = stub_model(User, :id => 1, :name => 'User name2')
    @posts = assign(:posts, [
    stub_model(Post,
        :title => "Title",
        :text => "MyText",
        :user_id => 1
      ),
      stub_model(Post,
        :title => "Title",
        :text => "MyText",
        :user_id => 1
      )
    ])
    
    @posts[0].stub!(:user_name).and_return('User name2')
    @posts[1].stub!(:user_name).and_return('User name3')
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "User name2", :count => 1
    assert_select "tr>td", :text => "User name3", :count => 1
  end
  
  it "should not show the buttons edit and delete when user is not login" do
    view.stub(:current_user).and_return(nil)
    assert_select ".btn btn-mini", :count => 0
    assert_select ".btn btn-mini danger", :count => 0
  end
end

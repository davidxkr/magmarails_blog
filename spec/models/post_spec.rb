require 'spec_helper'

describe Post, "Valid instance" do
  let(:post){ FactoryGirl.build(:post)}

  it "should be a valid instance" do 
    post.should be_valid
  end
  
  it "should have title" do 
    post.title = nil
    post.should_not be_valid
    post.should have(1).error_on(:title)
  end
  
  it "should have text" do 
     post.text = nil
     post.should_not be_valid
     post.should have(1).error_on(:text)
   end
end

describe Post, "Relations" do 
  
 it "should have many comments" do 
   p = Post.reflect_on_association(:comments)
   p.macro.should == :has_many
 end
 
 it "should belongs_to user" do
   p = Post.reflect_on_association(:user)
   p.macro.should == :belongs_to
 end
end

describe Post, "Delegates" do
  let(:post){ FactoryGirl.build(:post)}
  
  it "should respond #user_name" do
    post.should respond_to(:user_name)
  end
end

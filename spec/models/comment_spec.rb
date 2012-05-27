require 'spec_helper'

describe Comment, "Valid instance" do
  let(:comment){ FactoryGirl.build(:comment)}

  it "should be a valid instance" do 
    comment.should be_valid
  end
  
  it "should have user_name" do 
    comment.user_name = nil
    comment.should_not be_valid
    comment.should have(1).error_on(:user_name)
  end
  
  it "should have content" do 
     comment.content = nil
     comment.should_not be_valid
     comment.should have(1).error_on(:content)
   end
end

describe Comment, "Relations" do  
  it "should belongs_to post" do
    c = Comment.reflect_on_association(:post)
    c.macro.should == :belongs_to
  end
end

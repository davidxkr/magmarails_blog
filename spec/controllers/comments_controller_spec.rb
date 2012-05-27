require 'spec_helper'

describe CommentsController do
  describe "POST create posts/1/comment/" do 
    let(:post_a){stub_model Post, :id => 1}
    let(:comment){stub_model Comment, :post_id => 1}

    before(:each) do 
      Post.stub!(:find).with('1').and_return(post_a)
      @params = {'comment' => {'content' => 'test_comemnt'}}
    end
    
    def do_create
      post :create, {:post_id => '1', :comment => @params['comment']}
    end

    it "should assing @post" do 
      do_create
      assigns[:post].should eq(post_a)
    end

    it "should call find post" do 
      Post.should_receive(:find).with('1').and_return(post_a)
      do_create
    end

    it "post should build a comment" do 
      post_a.stub_chain(:comments, :build).with(@params['comment']).and_return(comment)
      do_create
    end

    it "should assign comments" do 
      post_a.stub_chain(:comments, :build).with(@params['comment']).and_return(comment)
      do_create
      assigns[:comment].should eq(comment)
    end

    it "should redirect to post show page" do
      post_a.stub_chain(:comments, :build).with(@params['comment']).and_return(comment)
      do_create
      response.should redirect_to post_path(post_a)
    end
  end #end create
  
  describe "DELETE destroy post/1/comments/1" do 
    let(:post_a){stub_model Post, :id => 1}
    let(:comment){stub_model Comment, :id => 1, :post_id => 1, :destroy => true}
     
     before(:each) do
       Comment.stub!(:find).with('1').and_return(comment)
       comment.stub!(:post).and_return(post_a)
     end
     
     def do_delete
       delete :destroy, {:id => 1, :post_id => 1}
     end

     it "should call the methods find" do
       Comment.should_receive(:find).with("1").and_return(comment)
       do_delete
     end

     it "should assign @comment" do 
       do_delete
       assigns[:comment].should eq(comment)
     end

     it "should call destroy" do 
       comment.should_receive(:destroy)
       do_delete
     end

     it "should redirect_to to index post" do
       do_delete
       response.should redirect_to post_path(post_a)
     end
   end # end DELETE ACTION
end
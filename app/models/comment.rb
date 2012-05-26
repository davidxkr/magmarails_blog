class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id, :user_name
  validates :content, :user_name, :presence => true
  belongs_to :post
end

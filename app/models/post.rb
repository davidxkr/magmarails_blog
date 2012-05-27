class Post < ActiveRecord::Base
  attr_accessible :text, :title, :user_id
  
  validates :text, :title, :presence => true
  has_many :comments, :dependent => :delete_all
  belongs_to :user
  
  delegate :name, :to => :user, :prefix => true
  
end

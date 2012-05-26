class Post < ActiveRecord::Base
  attr_accessible :text, :title, :user_id
  
  has_many :comments
  belongs_to :user
  validates :text, :title, :presence => true
  
  delegate :name, :to => :user, :prefix => true
  
end

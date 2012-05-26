class AddRelationToUserToPostAndComment < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_column :comments, :user_name, :string
  end
end

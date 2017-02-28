class RemovePostedByFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :posted_by, :string
  end
end

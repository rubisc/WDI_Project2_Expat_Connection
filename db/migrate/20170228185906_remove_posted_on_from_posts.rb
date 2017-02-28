class RemovePostedOnFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :posted_on, :datetime
  end
end

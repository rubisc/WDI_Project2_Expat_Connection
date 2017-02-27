class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :city
      t.string :venue
      t.text :address
      t.date :date
      t.time :start_hour
      t.time :end_hour
      t.string :theme
      t.text :body
      t.datetime :posted_on
      t.string :posted_by
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

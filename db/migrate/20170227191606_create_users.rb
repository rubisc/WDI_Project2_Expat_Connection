class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.string :home_city
      t.string :home_country
      t.string :current_city
      t.string :language
      t.string :second_language
      t.string :third_language
      t.text :bio

      t.timestamps
    end
  end
end

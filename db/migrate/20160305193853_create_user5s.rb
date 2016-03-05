class CreateUser5s < ActiveRecord::Migration
  def change
    create_table :user5s do |t|
      t.string :name
      t.string :email
      t.integer :age

      t.timestamps null: false
    end
  end
end

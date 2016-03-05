class CreateUser6s < ActiveRecord::Migration
  def change
    create_table :user6s do |t|
      t.string :name
      t.string :email
      t.integer :age

      t.timestamps null: false
    end
  end
end

class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :bio, default: nil
      t.string :email
      t.string :location, default: nil

      t.timestamps
    end
  end
end

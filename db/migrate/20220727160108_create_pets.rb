class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :sex
      t.string :bio
      t.integer :weight
      t.integer :age
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

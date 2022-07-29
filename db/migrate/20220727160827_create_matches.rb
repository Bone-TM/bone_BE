class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :pet, foreign_key: true
      t.integer :matched_pet_id

      t.timestamps
    end
  end
end

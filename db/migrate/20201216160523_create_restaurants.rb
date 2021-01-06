class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.references :cuisine
      t.text :description
      t.integer :price
      t.integer :rating
      t.boolean :is_chain

      t.timestamps
    end
  end
end

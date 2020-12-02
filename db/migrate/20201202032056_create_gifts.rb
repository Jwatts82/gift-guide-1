class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :comment
      t.string :store
      t.integer :price
      t.integer :user_id
      t.integer :list_id

      t.timestamps
    end
  end
end

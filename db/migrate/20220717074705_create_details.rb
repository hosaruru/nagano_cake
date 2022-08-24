class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :amount

      t.timestamps
    end
  end
end

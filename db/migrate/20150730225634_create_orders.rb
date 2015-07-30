class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :customer
      t.belongs_to :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

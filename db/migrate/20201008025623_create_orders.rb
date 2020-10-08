class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :postal           ,null: false
      t.integer    :shipping_area_id ,null: false
      t.string     :city             ,null: false
      t.string     :address          ,null: false
      t.string     :call             ,null: false
      t.string     :building         ,null: false
      t.timestamps
    end
  end
end

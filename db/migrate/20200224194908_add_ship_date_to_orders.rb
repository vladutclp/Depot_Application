class AddShipDateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :ship_date, :date
  end
end

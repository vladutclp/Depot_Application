class AddPayTypeToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :integer, :string
  end
end

class RemoveTaxRatesFromOrders < ActiveRecord::Migration[5.1]
  def up
  	remove_column :orders, :pst_rate, :decimal
  	remove_column :orders, :hst_rate, :decimal
  	remove_column :orders, :gst_rate, :decimal
  	add_column :orders, :amount, :decimal
  end
end

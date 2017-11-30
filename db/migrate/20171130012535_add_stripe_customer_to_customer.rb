class AddStripeCustomerToCustomer < ActiveRecord::Migration[5.1]
  def change
  	add_column :customers, :stripe_customer, :string
  end
end

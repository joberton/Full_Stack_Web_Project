ActiveAdmin.register Customer do
permit_params :first_name, :last_name, :address, :postal_code, :email, :user_id, :stripe_customer
end

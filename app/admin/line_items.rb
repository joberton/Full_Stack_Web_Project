ActiveAdmin.register LineItem do
permit_params :product_name,:price,:quantity,:order_id
end

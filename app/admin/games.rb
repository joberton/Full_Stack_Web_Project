ActiveAdmin.register Game do
permit_params :name, :price, :description, :date_released, :product_type_id, :genre_id, :console_id, :image
end

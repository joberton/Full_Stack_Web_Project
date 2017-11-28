ActiveAdmin.register Order do
permit_params :status, :amount, :user_id
end

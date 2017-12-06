class CreateAboutUs < ActiveRecord::Migration[5.1]
  def change
    create_table :about_us do |t|
      t.string :description
      t.string :address
      t.string :city
      t.string :phone_number
      t.string :contact_email

      t.timestamps
    end
  end
end

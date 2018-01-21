class CreateRestaurants < ActiveRecord::Migration[5.1]
   def change
     create_table :restaurants do |t|
    	t.string "name"
    	t.string "location"
    	t.string "cuisine"
    	t.boolean "service_charge", :default => false 
    	t.boolean "vat", :default => false
    	t.string "contact"
    end
  end
end

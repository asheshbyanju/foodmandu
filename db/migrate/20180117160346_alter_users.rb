class AlterUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column("users", "role", :string, :limit => 25,
  :after => "encrypted_password")
  end
end

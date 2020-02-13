class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.column "first_name", :string, :limit => 25
      t.string "last_name", :limit => 50
      t.string "password_digest", :null => false
      t.string "username", limit: 25
      t.string "email" 
      t.timestamps
    end
    add_index("users", "username")
  end
end

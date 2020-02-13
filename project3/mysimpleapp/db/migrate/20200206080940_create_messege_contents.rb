class CreateMessegeContents < ActiveRecord::Migration[5.2]
  def change
    create_table :messege_contents do |t|
      t.integer "user_id", :null => false 
      t.integer "post_id", :null => false 
      t.string "content" 
      t.timestamps
    end
    add_index("messege_contents", "post_id")
  end
end

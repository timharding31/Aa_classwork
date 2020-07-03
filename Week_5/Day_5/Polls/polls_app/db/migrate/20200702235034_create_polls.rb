class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.integer :user_id, null: false
      t.string :title, unique:true 
      t.timestamps
    end
  end
end

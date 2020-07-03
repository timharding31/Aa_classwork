class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.integer :poll_id, null:false
      t.text :text, null:false
      t.timestamps
    end
  end
end

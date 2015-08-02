class CreateWorks < ActiveRecord::Migration
  
  def change
    create_table :works do |t|
      t.string :filename
      t.string :external_id
      t.integer :camera_model_id
      t.datetime :date_time
    end    
  end
  
end
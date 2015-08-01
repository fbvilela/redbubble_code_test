class CreateCameraMakes < ActiveRecord::Migration

  def change
    create_table :camera_makes do |t|
      t.string :name
      t.timestamps
    end
  end

end
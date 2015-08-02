class CreateCameraMakes < ActiveRecord::Migration

  def change
    create_table :camera_makes do |t|
      t.string :name
    end
  end

end
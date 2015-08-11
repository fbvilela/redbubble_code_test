class CreateCameraModels < ActiveRecord::Migration

  def change
    create_table :camera_models do |t|
      t.string :name
      t.integer :camera_make_id
    end
  end

end
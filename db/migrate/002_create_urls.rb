class CreateUrls < ActiveRecord::Migration

  def change
    create_table :urls do |t|
      t.string :url_type
      t.string :link
      t.integer :work_id
      t.timestamps
    end
  end

end
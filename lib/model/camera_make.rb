class CameraMake < ActiveRecord::Base
  default_scope { order('name asc') } 	
  has_many :camera_models
  has_many :works , through: :camera_models

  validates :name, presence: true

  def latest_works
    works.latest
  end
end
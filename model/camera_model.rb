class CameraModel < ActiveRecord::Base
  belongs_to :camera_make
  has_many :works

  validates :name, presence: true
  validates :camera_make_id, presence: true

end
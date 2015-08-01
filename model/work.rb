class Work < ActiveRecord::Base
  belongs_to :camera_model
  has_one :camera_make, through: :camera_model
  has_many :urls

  validates :external_id, uniqueness: true
end
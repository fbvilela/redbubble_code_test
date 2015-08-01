class CameraMake < ActiveRecord::Base
  has_many :camera_models
  has_many :works , through: :camera_models

  validates :name, presence: true
end
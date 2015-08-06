require_relative 'url'
class Work < ActiveRecord::Base
  belongs_to :camera_model
  has_one :camera_make, through: :camera_model
  has_many :urls

  validates :external_id, uniqueness: true

  def thumbnail_url
    urls.where( url_type: 'small' ).first.link
  end

  scope :latest, -> { order( 'date_time desc' ).limit(10) }

end
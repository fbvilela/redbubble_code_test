class Url < ActiveRecord::Base
  belongs_to :work

  validates :link, presence: true
  validates :link, format: { with:  /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix}
end
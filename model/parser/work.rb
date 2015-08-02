require_relative 'Url'
require_relative '../../model/camera_make'
require_relative '../../model/camera_model'
require_relative '../../model/work'
module Parser
  class Work
    include SAXMachine
    element :id, as: :external_id
    element :filename
    elements :url, as: :urls, class: Url

    #Was using a separate class for it, but I don't think it's necessary
    #element :exif, class: Exif
    element :model
    element :make
    element :date_time do |element|
      Time.parse( element )
    end

    def persist
      camera_make_id =  CameraMake.find_or_create_by( name: make ).id
      camera_model_id = CameraModel.find_or_create_by( name: model, camera_make_id: camera_make_id ).id
      work = ::Work.find_or_initialize_by( external_id: external_id )
      work.camera_model_id = camera_model_id
      work.filename = filename
      work.date_time = date_time
      if work.save
        urls.each do |url|
          url.persist( work.id )
        end
      end
    end
  end
end

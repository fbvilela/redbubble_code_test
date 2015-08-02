require 'fileutils'
class PageGenerator

  attr_accessor :output_folder

  def initialize( output_folder )
    @output_folder = output_folder
  end

  def generate_index
    generated_page = ERB.new(File.new('view_templates/index.erb').read ).result( binding )
    write( generated_page, 'index.html' )
  end

  def generate_camera_makes
    CameraMake.find_each do |camera_make|
      generated_page = ERB.new(File.new('view_templates/camera_make/page.erb').read ).result( binding )
      page_name = "camera_make_#{camera_make.id}.html"
      write( generated_page, page_name )
    end
  end

  def generate_camera_models
    CameraModel.find_each do |camera_model|
      generated_page = ERB.new(File.new('view_templates/camera_model/page.erb').read ).result( binding )
      page_name = "camera_model_#{camera_model.id}.html"
      write( generated_page, page_name )
    end
  end

  def generate_page_for_model( model )
    #Will refactor the generator later... make it Dry er.
    #page_name = model.class.
  end

  def write( content, page_name )
    FileUtils.makedirs( output_folder ) unless File.exist?(output_folder)
    File.open( File.join( output_folder, page_name ), 'w' ){ |f| f.write( content ) }
  end

end
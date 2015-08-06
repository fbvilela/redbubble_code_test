require 'fileutils'
class PageGenerator

  attr_accessor :output_folder
  
  def per_page
    10
  end
    
  def include_basic_css
    application_css = File.new( File.join( 'lib', 'view_templates', 'css', 'application.css') ).read
    <<-EOS
      <style type="text/css">
        #{application_css}
      </style>
    EOS
  end

  def include_jquery_js
    <<-EOS
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    EOS
  end

  def include_pagination_js
    application_js = File.new(File.join( 'lib', 'view_templates', 'javascript', 'application.js' ) ).read
    <<-EOS
      <script type="text/javascript">
        #{application_js}
      </script>
    EOS
  end
  
  def initialize( output_folder )
    @output_folder = output_folder
  end

  def generate_index
    generated_page = ERB.new(File.new( File.join('lib','view_templates', 'index.erb')).read ).result( binding )
    write( generated_page, 'index.html' )
  end

  def generate_camera_makes
    CameraMake.find_each do |camera_make|
      generated_page = ERB.new(File.new(File.join('lib','view_templates','camera_make','page.erb')).read ).result( binding )
      page_name = "camera_make_#{camera_make.id}.html"
      write( generated_page, page_name )
    end
  end

  def generate_camera_models
    generate_page_for( CameraModel, 'camera_model')
    CameraModel.find_each do |camera_model|
      generated_page = ERB.new(File.new(File.join('lib','view_templates', 'camera_model', 'page.erb')).read ).result( binding )
      page_name = "camera_model_#{camera_model.id}.html"
      write( generated_page, page_name )
    end
  end

  def write( content, page_name )
    FileUtils.makedirs( output_folder ) unless File.exist?(output_folder)
    File.open( File.join( output_folder, page_name ), 'w' ){ |f| f.write( content ) }
  end



end
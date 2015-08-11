class TaskWrapper

	attr_accessor :input_file
	attr_accessor :output_folder

	def validate_arguments( arguments )
		unless arguments.length == 2
		  raise ArgumentError.new('Wrong number of arguments.  Usage: `ruby run.rb XML_INPUT_FILE OUTPUT_FOLDER`')
		end
		@input_file = arguments[0]
		@output_folder = arguments[1]
	end

	def validate_input_file
		unless File.exists?( input_file )
  		raise ArgumentError.new "The requested file #{@input_file} was not found"
		end
	end

  def validate_output_folder
  	begin
  		FileUtils.mkdir_p( output_folder )
  	rescue Errno::EACCES
  		raise ArgumentError.new "Error: The folder #{output_folder} is not writable. check your permissions."
  	end
  	unless (Dir.entries("#{output_folder}") - %w{ . .. }).empty?
  		puts "the contents on #{output_folder} will be overwritten"
  	end
  end

	def initialize_database		
		ActiveRecord::Base.establish_connection(
		  adapter:  "sqlite3",
		  database: "database/works.db"
		)
		puts "Checking if database exists..."
		unless ActiveRecord::Base.connection.tables.include? ['works', 'urls', 'camera_makes', 'camera_models' ] 
		  puts "Running database migrations"
		  ActiveRecord::Migrator.migrate('lib/migrations')
		end
	end

	def parse_xml
		puts "Parsing XML..."
		works_xml = IO.read(input_file)
		works = Parser::WorksParser.parse( works_xml )
		puts "Saving into the database..."
		works.persist
		puts "Ready to generate pages..."
	end

	def generate_pages
		page_generator = PageGenerator.new( output_folder )
		puts "Generating index..."
		page_generator.generate_index
		puts "Generating camera makes pages..."
		page_generator.generate_camera_makes
		puts "Generating camera models pages..."
		page_generator.generate_camera_models
	end

	
end
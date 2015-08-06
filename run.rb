require_relative 'redbubble_code_test'

ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'w'))
ActiveRecord::Base.establish_connection(
  adapter:  "sqlite3",
  database: "database/works.db"
)
Work.connection

xml_file = ARGV[0] || 'resources/works.xml'
output_folder = ARGV[1] || 'output'

unless File.exists?( xml_file )
  puts "Requested file #{xml_file} not found"
  exit(0)
end

puts "Checking if database exists..."
unless ActiveRecord::Base.connection.tables.include? 'works'
  puts "Running database migrations"
  ActiveRecord::Migrator.migrate( 'db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end

puts "Parsing XML..."
works_xml = IO.read(xml_file)
works = Parser::WorksParser.parse( works_xml )
puts "Saving into the database..."
works.persist
puts "Ready to generate pages..."

# create index
page_generator = PageGenerator.new( output_folder )
puts "Generating index..."
page_generator.generate_index

puts "Generating camera makes pages..."
page_generator.generate_camera_makes
puts "Generating camera models pages..."
page_generator.generate_camera_models
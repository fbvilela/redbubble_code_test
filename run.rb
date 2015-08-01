require 'rubygems'
require 'active_record'
require_relative 'model/parser/works_parser'

ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'w'))
ActiveRecord::Base.establish_connection(
  adapter:  "sqlite3",
  database: "database/works.db"
)

xml_file = ARGV[0]
destination = ARGV[1]

unless File.exists?( xml_file )
  puts "File #{xml_file} not found"
end


unless ActiveRecord::Base.connection.tables.include? 'works'
  ActiveRecord::Migrator.migrate( 'db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end

works_xml = IO.read(xml_file)
works = Parser::WorksParser.parse( works_xml )
works.persist
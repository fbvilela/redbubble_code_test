require_relative 'redbubble_code_test'

task_wrapper = TaskWrapper.new

begin
	start_time = Time.now 
  task_wrapper.validate_arguments( ARGV )
	task_wrapper.validate_input_file
	task_wrapper.validate_output_folder
	task_wrapper.initialize_database
	task_wrapper.parse_xml
	task_wrapper.generate_pages
	puts "Finished in #{Time.now - start_time} seconds."
rescue => ex 
	puts ex.message
	exit(0)
end
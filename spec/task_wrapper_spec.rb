
describe TaskWrapper do 

	describe '#validate_arguments' do 
		context 'with the correct number of arguments' do 
			before { subject.validate_arguments(['input', 'output'])}
			it 'should store both input_file and output_folder instance variables' do 
				expect( subject.input_file ).to eq('input')	
				expect( subject.output_folder).to eq('output')
			end
		end
		context 'with the incorrect number of arguments' do 
			it 'should raise ArgumentError' do 
				expect{ subject.validate_arguments([])}.to raise_error(ArgumentError)
			end
		end
	end


	describe '#validate_input_file' do 
		context 'with an invalid input file' do
			before{	allow(subject).to receive(:input_file).and_return('a_dodgy_file_path.xml') }			 
			it 'should raise an error' do 
				expect{ subject.validate_input_file}.to raise_error( ArgumentError )
			end
		end
		context 'with a valid input file' do 
			before{ allow(subject).to receive(:input_file).and_return('resources/works.xml') }
			it 'should not raise an error' do 
				expect{ subject.validate_input_file}.to_not raise_error 
			end
		end
	end


	describe '#validate_output_folder' do 
		context 'when the folder is not writable' do 
			before{ allow(subject).to receive(:output_folder).and_return('/root/anything') }
			it 'should raise an error' do 
				expect{ subject.validate_output_folder}.to raise_error( ArgumentError )
			end 
		end
	end

	describe '#initialize_database' do 
		#Was going to write a spec that checks if migrate method is called when the tables don't exist... but I think it's kind of a dull test. 
	end

end

describe 'WorksParser' do 

	context 'given the works.xml' do 
		before(:all) do
			works_xml = File.new( File.join('resources', 'works.xml')).read
			@parser = Parser::WorksParser.parse(works_xml)
		end 		
		it 'should parse 14 work elements' do 
			expect( @parser.works.count).to eq(14)
		end

		it 'should parse 6 camera makes' do 
			expect( @parser.works.collect(&:make).uniq.reject(&:blank?).count).to eq(6)
		end

		it 'should parse 7 camera models' do 
			valid_camera_models = @parser.works.collect(&:model).uniq.reject(&:blank?)
			expect( valid_camera_models.count).to eq(7)
		end

	end

end
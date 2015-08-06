
describe 'WorksParser' do 

	context 'given the works.xml' do 
		before(:all) do
			@works_xml = File.new( File.join('resources', 'works.xml')).read
		end 		
		it 'should parse 14 work elements' do 
			expect( Parser::WorksParser.parse(@works_xml).works.count).to be(14)
		end

	end

end
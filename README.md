# redbubble_code_test
My take on the Redbubble code challenge.

Ruby version 2.2.2

## Usage
`bundle` to install the gems

`ruby run.rb where_works_xml_is output_folder`

## Rspec Tests
`rake` will run a few tests.
As you can see by the commits, I didn't do any test driven development, the tests
were added at the end, even though a lot of refactoring was done because of it.
TDD or BDD is what I'm expecting to work with in the future, but it does not reflect 
where I am at the moment. Keen to learn!

## Notes
Wanted the code to be easy to follow and split into clear steps.
I do like xml-to-object mapping and have been using happy-mapper for a while. `sax-machine` seemed to be pretty cool and I took the opportunity to try it.
Wanted to work with templates rather than using some sort of string buffer to generate the html content. I like templates so the designers can play around with the 
html and css while leaving the ruby bits as they are. Got a working version of the templates with TwitterBootstrap but the DOM ended up a bit different than the layout provided and that might not be the focus of the challenge.
To test pagination with a smaller works.xml file, the method `per_page` on `PageGenerator` could be changed to something like '1' or '2'

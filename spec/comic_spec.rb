require 'rspec'
require 'comic'

describe 'Comic' do
  it 'initializes a new comic with a title, issue number, publisher and worth' do
    new_comic = Comic.new({'title'=>'The Walking Dead', 'issue_num'=> 1, 'publisher'=>'Image', 'worth'=>999.99})
    new_comic.should be_an_instance_of Comic
  end
end
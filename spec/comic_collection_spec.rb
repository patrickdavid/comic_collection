require 'rspec'
require 'comic_collection'

describe 'Comic_collection' do
  it 'creates an instance of Comic collection by publisher' do
    Comic_collection.new('Image').should be_an_instance_of Comic_collection
  end
  
  it 'displays all comics' do
    new_collection1 = Comic_collection.new('Image')
    new_collection1.save
    new_collection2 = Comic_collection.new('Marvel')
    new_collection2.save
    expect(Comic_collection.all).to eq [new_collection1, new_collection2]
  end
  
  it 'adds a new comic to the comic collection array' do
    new_collection1 = Comic_collection.new('Image')
    new_collection1.save
    new_comic = Comic.new({'title'=>'The Walking Dead', 'issue_num'=> '1',  '@cgi'=>"9.2", 'worth'=>'999.99'})
    new_collection1.add_comic(new_comic)
    expect(new_collection1.comics).to eq [new_comic]
  end
end
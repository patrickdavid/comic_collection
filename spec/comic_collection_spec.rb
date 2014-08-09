require 'rspec'
require 'comic_collection'

describe 'Comic_collection' do
  
  before do
    Comic_collection.clear
  end
  
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
  
  it 'allows you to remove a comic' do
    new_collection1 = Comic_collection.new('Image')
    new_collection1.save
    new_comic = Comic.new({'title'=>'The Walking Dead', 'issue_num'=> 1,  'worth'=>999.99})
    new_comic1 = Comic.new({'title'=>'Archie Dumps Veronica', 'issue_num'=> 123,  'worth'=>1.99})
    new_collection1.add_comic(new_comic)
    new_collection1.add_comic(new_comic1)
    new_collection1.remove_comic(new_comic1)
    expect(new_collection1.comics).to eq [new_comic]
  end
  
  it 'allows a user to see how much their comics are worth' do
    new_collection1 = Comic_collection.new('Image')
    new_collection1.save
    new_collection2 = Comic_collection.new('Marvel')
    new_collection2.save
    new_comic = Comic.new({'title'=>'The Walking Dead', 'issue_num'=> 1,  'worth'=>999.99, '@cgi'=>"9.2"})
    new_comic1 = Comic.new({'title'=>'Archie Dumps Veronica', 'issue_num'=> 123,  'worth'=>1.99})
    new_comic2 = Comic.new({'title'=>'Archie Dumps Veronica', 'issue_num'=> 124,  'worth'=>1.99})
    new_comic3 = Comic.new({'title'=>'Archie Dumps Veronica', 'issue_num'=> 125,  'worth'=>1.99})
    new_collection1.add_comic(new_comic)
    new_collection1.add_comic(new_comic1)
    new_collection1.add_comic(new_comic2)
    new_collection1.add_comic(new_comic3)
    new_comic4 = Comic.new({'title'=>'The Incredible Hulk', 'issue_num'=> 181,  'worth'=>999.99, '@cgi'=>"9.6"})
    new_comic5 = Comic.new({'title'=>'The New Mutants', 'issue_num'=> 98,  'worth'=>200.99, '@cgi'=>"9.0"})
    new_comic6 = Comic.new({'title'=>'The Walking Dead', 'issue_num'=> 27,  'worth'=>224.99})
    new_comic7 = Comic.new({'title'=>'Archie Dumps Veronica', 'issue_num'=> 125,  'worth'=>1.99})
    new_collection2.add_comic(new_comic4)
    new_collection2.add_comic(new_comic5)
    new_collection2.add_comic(new_comic6)
    new_collection2.add_comic(new_comic7)
    expect(Comic_collection.comics_asset).to eq 2433.92
  end
end
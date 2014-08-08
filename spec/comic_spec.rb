require 'rspec'
require 'comic'

describe 'Comic' do
  it 'initializes a new comic with a title, issue number, publisher and worth' do
    new_comic = Comic.new({'title'=>'The Walking Dead', 'issue_num'=> 1,  'worth'=>999.99})
    new_comic.should be_an_instance_of Comic
  end
  
  it 'allows a user to edit a comic books worth' do
    new_comic = Comic.new({'title'=>'The Walking Dead', 'issue_num'=> '1',  '@cgi'=>"9.2", 'worth'=>'999.99'})
    new_comic.edit_worth(1000.00)
    expect(new_comic.worth).to eq 1000.00
  end
  
  it 'allows a user to edit a comic books condition ie if it goes from a near mint grade to very good grade' do
    new_comic = Comic.new({'title'=>'The Walking Dead', 'issue_num'=> '1',  '@cgi'=>"9.2", 'worth'=>'999.99'})
    new_comic.edit_grade(8.5)
    expect(new_comic.cgi).to eq 8.5
  end
end
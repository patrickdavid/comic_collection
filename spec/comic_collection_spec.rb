require 'rspec'
require 'comic_collection'

describe 'Comic_collection' do
  it 'creates an instance of Comic collection by publisher' do
    Comic_collection.new('Image').should be_an_instance_of Comic_collection
  end
end
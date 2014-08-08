class Comic_collection
  
  @@all_comics = []
  
  def self.all
    @@all_comics
  end
  
  def initialize(publisher)
    @publisher = publisher
    @comics = []
  end
  
  def save
    @@all_comics << self
  end
end
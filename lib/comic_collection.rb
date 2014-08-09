class Comic_collection
  
  @@all_comics = []
  
  def self.all
    @@all_comics
  end
  
  def initialize(publisher)
    @publisher = publisher
    @comics = []
  end
  
  def publisher
    @publisher
  end
  
  def comics
    @comics
  end
  
  def save
    @@all_comics << self
  end
  
  def add_comic(comic)
    @comics << comic
  end
  
  def remove_comic(comic)
    @comics.each do |issue|
      if issue == comic
        @comics.delete(comic)
      end
    end
  end
end
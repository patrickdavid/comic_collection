class Comic
  
  attr_reader :title, :issue_num, :publisher, :worth
  
  def initialize(property)
    @title = property['title']
    @isssue_num = property[issue_num].to_i
    @publisher = property['publisher']
    @worth = property[worth]
  end
end
  
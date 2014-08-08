class Comic
  
  attr_reader :title, :issue_num, :worth
  
  def initialize(property)
    @title = property['title']
    @isssue_num = property[issue_num].to_i
    @worth = property[worth]
  end
end
  
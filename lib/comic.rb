class Comic
  
  attr_reader :title, :issue_num, :worth, :cgi
  
  def initialize(property)
    @title = property['title']
    @isssue_num = property['issue_num'].to_i
    @worth = property['worth'].to_f
    @cgi = property['cgi'].to_f
  end
  
  def edit_worth(new_worth)
    @worth = new_worth
  end
  
  def edit_grade(condition)
    @cgi = condition
  end
  
end
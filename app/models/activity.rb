class Activity < ActiveRecord::Base

  before_save :build_arrays
  
  validates_presence_of :user_id, :body
  validates_length_of :body, :maximum => 140

  def self.search(criteria)
    if criteria =~ /@/
      self.all(:conditions => ["at_users like ?", '%' + criteria.gsub('@','') + '%'])
    elsif criteria =~ /#/
      self.all(:conditions => ["topics like ?", '%' + criteria.gsub('#','') + '%'])
    elsif criteria =~ /&/
      self.all(:conditions => ["people like ?", '%' + criteria.gsub('&','') + '%'])      
    end
  end
  
  def at_users
    read_attribute(:at_users).split(',')
  end
    
  def topics
    read_attribute(:topics).split(',')
  end
  
  def people
    read_attribute(:people).split(',')
  end
        
private
  
  def build_arrays
    self.at_users = build_array('@').join(',')
    self.topics = build_array('#').join(',')
    self.people = build_array('&').join(',')
  end
  
  def build_array(array_type)
    self.body.scan(/#{array_type}([A-Za-z0-9_]+)/).map { |element| element[0]}
  end

end

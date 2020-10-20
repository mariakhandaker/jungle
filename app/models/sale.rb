class Sale < ActiveRecord::Base
  #AR scope
  def self.active?
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current.an)
  end
  
  def finished?
    ends_on < Date.current
  end
  
  def upcoming?
    starts_on > Date.current
  end
  
  def active? 
    !upcoming? && !finished?
  end
  
end

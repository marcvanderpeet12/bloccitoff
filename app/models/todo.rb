class Todo < ActiveRecord::Base
  belongs_to :user

  validates :description, length: { minimum: 5 }

  def self.search(query)
    where("description like ?", "%#{query}%") 
  end  
  
end

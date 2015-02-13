class Todo < ActiveRecord::Base
  belongs_to :user

  validates :description, length: { minimum: 5 }

  def self.search(query)
    where("description like ?", "%#{query}%") 
  end  

  def self.destroy_all_old
    where("created_at <= ?", Time.now - 7.days).destroy_all
  end
  
end

require 'rails_helper'

feature 'Project manager creates TODO' do
  it "performs a days_left function on items" do
     
   @todo = Todo.new(description: "item1") 
   @todo.save

   expect(@todo.days_left).to eql 7.days.from.now
  end
end

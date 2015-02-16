require 'rails_helper'

feature 'Project manager creates TODO' do

   @user = authenticated_user

   @todo1 = Todo.new(description: "item1") 
   @todo1.save
   @todo1 << @user.todos

   @todo2 = Todo.new(description: "item2", created_at: "2015-01-07 09:59:46.781185")
   @todo2.save
   @todo2 << @user.todos

   expect(user.todos.count).to eq(2)
   click_link('Delete last 7 days')
   expect(user.todos.todo.count).to eq(1)

end

def authenticated_user
 user = User.new(email: "email#{rand}@fake.com", password: 'password')
 user.save
 user

 visit root_path
  click_link ('Sign In')
  fill_in "Email", with: user.Email
  fill_in "Password", with: user.Password
  click_link ('Log in')
end
require 'rails_helper'

feature 'Project manager creates TODO' do

  scenario 'Project manager succesfully deletes an item' do
   user = authenticated_user
   todo = user.todos.build(description: "item1") 

   #I build a todo on user which is logged in. So why do I get an undefined method todos for nilclass.
   visit todos_path   
   expect(user.todos.count).to eq(1)
   
   click_link('Delete')
   expect( page ).to have_content('Your todo was deleted!')
   expect(todos.count).to eq(0)
  end

  scenario 'Project manager does not succed in deleting an item' do
   visit todos_path   
   expect(todos.count).to eq(1)
   
   click_link('Delete')
   expect( page ).to have_content('Your todo was deleted!')
   expect(todos.count).to eq(1)
  end
end

def authenticated_user
   user = User.new(email: "email#{rand}@fake.com", password: 'password')
   user.save
   user

   visit root_path
    click_link ('Sign In')
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button ('Sign in')
  end
require 'rails_helper'

feature 'Project manager creates TODO' do
  
  scenario 'Projectmanager succesfully creates an item' do
    user = authenticated_user
    visit new_todo_path

    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'

    expect( page ).to have_content('Your new TODO was saved')
    expect( page ).to have_content('Meet up with the team')

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


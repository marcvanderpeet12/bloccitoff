require 'rails_helper'

feature 'People can sign-in' do

  scenario 'Log in successfully' do
    # include TestFactories
    visit root_path
    expect( page ).to have_content('Sign In')
    @user = authenticated_user

    click_link ('Sign In')

    expect(current_path).to eq(new_user_session_path)

      #why do I get a syntax error here, should work right?

     fill_in 'Email', with: @user.email
     fill_in 'Password', with: @user.password
     click_button ('Log in')

     expect(current_path).to eq(root_path)
     expect( page ).to have_content('Signed in successfully.')
     expect( page ).to have_content('Sign out')

  end
end

def authenticated_user
 user = User.new(email: "email#{rand}@fake.com", password: 'password')
 user.save
 user
end
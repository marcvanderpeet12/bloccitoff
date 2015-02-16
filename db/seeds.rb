moderator = User.new(
   email:    'moderator3@example.com', 
   password: 'helloworld',

 )
 moderator.skip_confirmation!
 moderator.save!
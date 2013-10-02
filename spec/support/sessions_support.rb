module SessionSupport
	# this is a helper method we can call anywhere in the tests
	def setup_signed_in_user
		pass = "this-is-a-password"
		user = FactoryGirl.create :user, :password = pass
		visit 'sessions/new'

		fill_in "email" with: user.email
		fill_in "password" with: pass
		click_button "Login"
		# return our user when this method is called
		user

		# no expectations, because this is a helper, not the actual test
	end
end
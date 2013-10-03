require 'spec_helper'

describe "UserAuthenticationFlows", js: true do
  describe "when visiting sign in page" do
  	it "should successfully register a user" do

  		visit "/users/new"
  		expect(current_path).to eq(new_user_path)

  		#expect there to be a link in the nav to sign up
  		within(:css, '.navbar') do
  			find_link("Sign Up").visible?
  		end

  		user = FactoryGirl.build(:user)

  		# fill in the form with the info from user created by FactoryGirl
  		fill_in "user[email]", :with => user.email
  		fill_in "user[first_name]", :with => user.first_name
  		fill_in "user[last_name]", :with => user.last_name
  		fill_in "user[password]", :with => user.password
      fill_in "user[password_confirmation]", :with => user.password
  		click_button "Create Account"

  		# after submitting the form, should be redirected to the root
  		expect(current_path).to eq(root_path)
  		# with a message that says "Account Created"
  		expect(page).to have_content("Account Created")
  		# and the nav no longer has a link to "sign up" but to "log out"
  		within(:css, '.navbar') do
  			has_no_link?("Sign Up")
  			has_link?("Log Out")
  		end
  	end

  	# it "should fail registration" do
  	# 	visit "/users/new"
  	# 	user = FactoryGirl.build(:user)

  	# 	# invalid form submission
  	# 	fill_in "user[email]", :with => user.email
  	# 	click_button "Create Account"
  	# 	# should redirecto to users path...
  	# 	expect(current_path).to eq(users_path)

  	# 	#no messages should appear
  	# 	expect(page).to have_no_content("Account Created")

   #    # Should see "try again" message on failure to register
   #    within(:css, '.alert') do
   #      have_content("Try Again")
   #    end
  	# end

    it "should successfully log in" do
      visit "/"
      find('.navbar').has_no_link?('Log Out').should be_true
      # calling the helper method here 
      user = setup_signed_in_user
      find('.navbar').has_link?('Log Out').should be_true
    end

    # it "should unsuccessfully log in" do 
    #   visit '/sessions/new'

    #   fill_in "email", with: "a@b.com"
    #   fill_in "password", with: "invalid creds"
    #   click_button "Log In"

    #   expect(current_path).to eq(sessions_path)

    #   expect(page).to have_content('Invalid')
    # end

    # it "should successfully logout" do
    #   #calling helper method again
    #   user = setup_signed_in_user
    #   visit '/'
    #   find('.navbar').click_link 'Log Out'
    #   expect(page).to have_content('Bye')

    #   find('.navbar').has_no_link?('Log Out')
    # end
  end
end

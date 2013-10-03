module SessionSupport
  # This is a helper method we can call anywhere in the tests
  def setup_signed_in_user
    user = FactoryGirl.build :user
    pass = user.password
    user.save
    visit '/sessions/new'

    fill_in "email", with: user.email
    fill_in "password", with: pass
    click_button "Log In"
    # Return our user when this method is called
    user

    # No expectations are written because testing is not done inside of a helper method
  end
end
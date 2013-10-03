require 'spec_helper'


describe "Pledge Listing" do
	describe "when visiting the pledge page" do
		before(:each) do
			@project = FactoryGirl.create :project
		end

		it "should require an authenticated user" do
			visit project_path(@project)

			click_link 'Back this project'

			expect(current_path).to eq(new_session_path)
			expect(page).to have_content("Please log in first")
		end

		it "authenticated user can pledge valid amount" do
			user = setup_signed_in_user

			visit project_path(@project)
			click_link "Back this project"

			# should be at pledge submission page, with 0 pledges in the databases currently
			expect(current_path).to eq(new_project_pledge_path(@project))
			expect(Pledge.count).to eq(0)

			fill_in 'pledge[amount]', with: 100
			click_button 'Pledge Now'

			# should be redirected back to project page with thank you message
			expect(current_path).to eq(project_path(@project))

			expect(page).to have_content("Thanks for pledging")

			# verify that the pledge was created with the right attributes
			pledge = Pledge.order(:id).last

			expect(pledge.user).to eq(user)

			expect(pledge.project).to eq(@project)

			expect(pledge.amount).to eq(100)

			expect(last_emai.to).to eq([@project.user.email])
		end
	end	
end

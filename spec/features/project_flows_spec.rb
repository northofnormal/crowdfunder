require 'spec_helper'

describe "Project Listing" do
	describe "when visiting the index page" do
		it "should display all projects" do
			# create three projects using FactoryGirl
			project1 = FactoryGirl.create(:project, :title => "Project 1")
			project2 = FactoryGirl.create(:project, :title => "Project 2")
			project3 = FactoryGirl.create(:project, :title => "Project 3")

			# go to the page with the projects
			visit "/projects"

			# Expect the page we are on is the page with the projects
			expect(current_path).to eq(projects_path)

			# Expect this page has the words "Listing Projects"
			page.should have_content("Listing Projects")
			expect(page).to have_content("Listing Projects")

			# Expect this page has the words as well 
			page.should have_content("Project 1")
			expect(page).to have_content("Project 1")

			page.should have_content("Project 2")
			expect(page).to have_content("Project 3")

			page.should have_content("Project 3")
			expect(page).to have_content("Project 3")
		end
	end
end
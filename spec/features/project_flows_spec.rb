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

			# click a link to show Project 1's page
			click_link('Project 1')
			# expect we are on Project 1's page
			expect(current_path).to eq(projects_path(project1))
			# expect on this page the first h1 has the text project1's title
			expect(page).to have_selector('h1:first', text: project1.title)
		end

		it "should display the navigation" do
			# visit the root URL
			visit '/'
			# expect the page we are on is root
			expect(current_path).to eq(root_path)
			# expect the home nave element is active
			page.should have_selector('.navbar ul li.active a', text: "Home")
			expect(page).to have_selector('.navbar ul li.active a', text: "Home")

			# click on the link to Projects
			page.find('.navbar ul').click_link('Projects')
			# expect that the page we are on is projects page
			expect(current_path).to eq(projects_path)

			# expect the projects nav element is active
			page.should have_selector('.navbar ul li.active a', text: "Projects")
			expect(page).to have_selector('.navbar ul li.active a', text: "Projects")
		end
	end
end
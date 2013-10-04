class ProjectsController < ApplicationController
  def index
  	@project = Project.order('projects.created_at DESC').page(params[:page]).per(8)
  end

  def show
  	@project = Project.find(params[:id])
  end

  def nav_state
  	@nav = :projects
  end
end

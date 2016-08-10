class ProjectsController < ApplicationController

  before_action :find_project, only:[:show, :edit, :update, :destroy]

	def index
    @projects = Project.order("created_at DESC").paginate(page: params[:page], per_page: 3)
  end

  def show
   
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to projects_path, notice: "The article has been successfully created."
    else
      render action: "new"
    end
  end

  def edit

  end

  def update
    if @project.update_attributes(article_params)
      redirect_to projects_path, notice: "The article has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy   
    @project.destroy
    redirect_to articles_path
  end

private

  def project_params
    params.require(:project).permit(:title, :body,:image)
  end

  def find_project
    @project = Project.friendly.find(params[:id])
  end

end

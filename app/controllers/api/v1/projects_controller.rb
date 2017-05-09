class Api::V1::ProjectsController < Api::ApiController

  def index
    if params[:completed]
      status = params[:completed] == "true" ? true : false
      @projects = Project.where('is_completed  = ?', status )
    else
    @projects = Project.all
    end
  end

  def create
    @project = Project.new(project_params)
    @project.save
  end

  def show
    @project = Project.find(params[:id])
  end


  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
  end
  private
  def project_params
    params[:project].permit(:name,:is_completed)
  end

end

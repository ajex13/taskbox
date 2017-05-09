class Api::V1::TasksController < Api::ApiController

  def index
    @project = Project.find(params[:project_id])
    if params[:status] == "completed"
      @tasks = @project.tasks.where('is_completed = ?',true)
    elsif params[:status] == "incomplete"
      @tasks = @project.tasks.where('is_completed = ? AND due_date >= ?',false,Date.today )
    elsif params[:status] = "over_due"
      @tasks = @project.tasks.where('is_completed = ? AND due_date < ?',false,Date.today)
    else
    @tasks =  Task.where('project_id = ? ', params[:project_id])
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    @task.save
  end

  def update

    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
  end

  private

  def task_params
    params[:task].permit(:title,:due_date,:project_id,:is_completed )
  end
end

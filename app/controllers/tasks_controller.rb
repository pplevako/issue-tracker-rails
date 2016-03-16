class TasksController < ApplicationController
  respond_to :json
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_task, only: [:show, :update]

  def index
    @tasks = Task.all
    respond_with @tasks
  end

  def show
    respond_with @task
  end

  def create
    @task = current_user.tasks.create(task_params)
    respond_with @task
  end

  def update
    @task.update_attributes(task_params)
    respond_with @task
  end

  private

  def task_params
    # TODO: use different permitted params for customer and developer?
    params.require(:task).permit(:title, :description, :status)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

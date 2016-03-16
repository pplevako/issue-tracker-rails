class TasksController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :update]

  after_action :verify_authorized, except: [:index]
  after_action :verify_policy_scoped, only: :index

  def index
    @tasks = policy_scope(Task)
    respond_with @tasks
  end

  def show
    authorize @task
    respond_with @task
  end

  def create
    @task = current_user.tasks.new
    authorize @task
    @task.update_attributes(permitted_attributes(@task))
    respond_with @task
  end

  def update
    authorize @task
    @task.update_attributes(permitted_attributes(@task))
    respond_with @task
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
end

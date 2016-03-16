class TasksController < ApplicationController
  respond_to :json
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_task, only: [:show, :update]

  after_action :verify_authorized, except: :index, :show
  after_action :verify_policy_scoped, only: :index

  def index
    @tasks = Task.all
    respond_with @tasks
  end

  def show
    respond_with @task
  end

  def create
    @task = current_user.tasks.new
    @task.update_attributes(permitted_attributes(@task))
    authorize @task
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

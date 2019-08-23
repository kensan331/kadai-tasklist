class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task =Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:succes] = 'Taksが正常に追加されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが追加されませんでした'
      render :new
    end
  end

  def edit
    @task =Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:succes] = 'Taksが正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'Taskは正常に削除されました'
    redirect_to task_url
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
  
end

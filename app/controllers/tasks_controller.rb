class TasksController < ApplicationController
    # before_action :get_category

    def index
        @tasks = Task.all
    end
        
    def show
        @task = Task.find(params[:id])
    end

    def new
        @tasks = Task.new
    end
    
    def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to tasks_path
        else
            render :new
        end
    end

    def edit
        @task = Task.find(params[:id])
    end
    
    def update 
        @task = Task.find(params[:id])

        if @task.update(task_params)
          redirect_to @task
        else
          render :edit
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
    
        redirect_to tasks_path
    end

    private
    def get_category
        @category = Category.find(params:[:category_id])
    end
    
    def task_params
        params.require(:task).permit(:name, :description, :category_id)
    end
end

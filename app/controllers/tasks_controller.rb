class TasksController < ApplicationController

    before_action :authenticate_user!
    before_action :get_category, only: [:index, :new, :create]
    before_action :get_categories, only: :today

    def index
        @tasks = @category.tasks
    end

    def today
        @tasks = Task.tasks_today
    end
        
    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = @category.tasks.build
    end
    
    def create
        @task = @category.tasks.build(task_params)
        @task.user_id = current_user.id
        @task.category_id = @category.id

        if @task.save
            redirect_to category_path(@category), notice: "New task created"
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
          redirect_to task_path, notice: "Task updated"
        else
          render :edit
        end
    end  

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
    
        redirect_to task_path, notice: "Task deleted"
    end

    private
    def get_category
        @category = current_user.categories.find(params[:category_id])
    end

    def get_categories
        @categories = current_user.categories.all
    end

    def task_params
        params.require(:task).permit(:name, :due_date, :description, :category_id, :user_id)
    end
end

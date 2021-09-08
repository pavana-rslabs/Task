class TasksController < ApplicationController
	before_action :set_task, only: [:show, :update, :destroy]

	def index
		@tasks = current_user.tasks
	end
	
	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		@task.user_id = current_user.id
		if @task.save
			redirect_to root_path
		else
			render 'new'
		end
	end	

	def show
	end	

	def edit
		@task = current_user.tasks.find(params[:id])
	end	

	def update
		if(@task.update(task_params))
			redirect_to root_path
		else
			render 'edit'
		end	

	end	

	def destroy
		@task.destroy
		redirect_to tasks_path
	end	

	private 

	def set_task
		@task = Task.find(params[:id])
	end
		
	def task_params
		params.require(:task).permit(:title, :description, :due_date, :user_id)
	end

end


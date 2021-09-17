require 'rails_helper'


RSpec.describe "/tasks", type: :request do
  before do
  	@user = User.first_or_create!(email: 'pavana.nayak17@gmail.com', password: 'pavanabs', password_confirmation: 'pavanabs')
  	sign_in @user

  end  
    
    let(:valid_attributes) do
      {
        'id' => '1',
        'title' => 'Task1',
        'description' => 'about the task',
        'due_date' => ' ',
        'user_id' => @user.id
        
       
      }
  end

    let(:invalid_attributes) do
      {
        'id' => 'a',
        'title' => '3b',
        'description' => '1234',
        'due_date' => ''
      }
    end

    describe 'get/index' do

      it 'renders a successful response' do
        
        task = Task.new(valid_attributes)
        task.save
        
        get tasks_url
        expect(response).to have_http_status(200)
      
       
        
        
      end
    end
    describe 'GET /show' do
    	it 'renders a successful response' do
        
        task = Task.new(valid_attributes)
      
        task.save

         get task_url(task)
         expect(response).to have_http_status(200)
       end
     end

     describe 'GET /new' do
       it 'renders a successful response' do
         get new_task_url
         expect(response).to have_http_status(200)
       end
     end

     describe 'GET /edit' do
       it 'render a successful response' do
         task = Task.new(valid_attributes)
         task.save
         get edit_task_url(task)
         expect(response).to have_http_status(200)
       end
     end

     describe 'Task /create' do
    context 'with valid parameters' do
      it 'creates a new Task' do
        
          task = Task.new(valid_attributes)
          task.save
          post tasks_url, params: { task: valid_attributes }
        
      end

      it 'redirects to the created task' do
        post tasks_url, params: { task: valid_attributes }
        expect(response).to have_http_status(201)
    end

  
  end
   
  end
end
      


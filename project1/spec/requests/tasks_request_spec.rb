require 'rails_helper'


RSpec.describe "/tasks", type: :request do
  before do
  	@user = User.first_or_create!(email: 'pavana.nayak17@gmail.com', password: 'pavanabs', password_confirmation: 'pavanabs')
  	sign_in @user
    #task = Task.create!(attributes)
    #task.save
  end  
    
    let(:attributes) do
      {
        'id' => '1',
        'title' => 'Task1',
        'description' => 'about the task',
        'due_date' => '2021-09-25',
        'user_id' => @user.id
        
       
      }
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
        expect do
          task = Task.new(valid_attributes)
          task.save

          post tasks_url, params: { task: valid_attributes }
        end.to change(Task, :count).by(2)
      end

      it 'redirects to the created task' do
        post tasks_url, params: { task: valid_attributes }
        expect(response).to have_http_status(200)
    end

    #context 'with invalid parameters' do
     # it 'does not create a new task' do
      #  expect do
       #   post tasks_url, params: { task: invalid_attributes }
        #end.to change(Task, :count).by(0)
     # end

      #it "renders a successful response (i.e. to display the 'new' template)" do
       # post tasks_url, params: { task: invalid_attributes }
        #expect(response).to be_successful
      #end
   # end
  end
   
  end
end
      


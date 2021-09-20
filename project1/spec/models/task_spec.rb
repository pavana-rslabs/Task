require 'rails_helper'

RSpec.describe Task, type: :model do
  current_user = User.first_or_create!(email: 'pavanabs9@gmail.com', password: 'pavanabs', password_confirmation: 'pavanabs')

  it 'title must be present' do
    task = Task.new(
    	title: '',
    	description: 'A Valid description',
    	user: current_user
    )
    expect(task).to_not be_valid
    task.title = 'project'
    expect(task).to be_valid
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User creation' do
    it 'can be created' do
      user = User.create(email: 'pavanabs@gmail.com', password: 'pavanabs', password_confirmation: 'pavanabs')
      
 	  expect(user.valid_password?('pavanabs')).to be_truthy	   
    end
  end
end



 
  
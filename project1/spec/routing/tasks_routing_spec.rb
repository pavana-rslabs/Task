require 'rails_helper'
RSpec.describe "routing to Tasks", :type => :routing do
  
  it "routes to #index and #show}" do
  expect(get: "/tasks").to route_to(
    controller: "tasks",
    action: "index") 
end


  it "routes to #new" do
    expect(get: "/tasks/new").to route_to(
      controller: "tasks",
      action: "new")
end

  it "routes to #edit" do
      expect(get: "/tasks/1/edit").to route_to(
        controller: "tasks",
        action: "edit",
        id: "1")
  end

  it "routes to #create" do
      expect(post: "/tasks").to route_to(
        controller: "tasks",
        action: "create")
  end

  it "routes to #update" do
      expect(put: "/tasks/1").to route_to(
        controller: "tasks",
        action: "update",
        id: "1")
  end

  it "routes to #destroy" do
      expect(delete: "/tasks/1").to route_to(
        controller: "tasks",
        action: "destroy",
        id: "1")
  end
end
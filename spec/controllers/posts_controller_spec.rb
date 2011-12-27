require File.dirname(__FILE__) + '/../spec_helper'

describe PostsController do
  render_views

  it "show action should render show template" do
    Post.create!(title: "Valid title", body: "Valid body")
    get :show, :id => Post.first
    response.should render_template(:show)
  end
end

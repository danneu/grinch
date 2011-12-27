require File.dirname(__FILE__) + '/../spec_helper'

describe Post do
  it "should require a title" do
    post = Post.new(title: "", body: "Here is some text.")
    post.should_not be_valid
  end

  it "should require a body" do
    post = Post.new(title: "This is a valid title", body: "")
    post.should_not be_valid
  end

  it "should have default category" do
    post = Post.create!(title: "Valid title", body: "Valid body")
    assert !post.categories.empty?
  end

end

require File.dirname(__FILE__) + '/../spec_helper'

describe Post do
  it "should be valid" do
    post = Post.new(title: "", body: "Here is some text.")
    post.should_not be_valid
  end
end

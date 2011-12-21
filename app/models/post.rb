class Post < ActiveRecord::Base
  attr_accessible :title, :body, :rendered_body
  before_save :render_markdown

  private

  def render_markdown 
    require 'rdiscount'
    self.rendered_body = RDiscount.new(self.body).to_html
  end
end

class Post < ActiveRecord::Base
  attr_accessible :title, :body
  before_save :render_body
  default_scope order('created_at DESC')
  has_and_belongs_to_many :categories

  private

  def render_body
    require 'rdiscount'
    self.rendered_body = RDiscount.new(self.body).to_html
  end
end

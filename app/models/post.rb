class Post < ActiveRecord::Base
  attr_accessible :title, :body, :category_ids
  before_save :render_body, :check_for_default_category
  default_scope order('created_at DESC')
  has_and_belongs_to_many :categories

  validates :title, presence: true
  validates :body, presence: true

  def to_param
    "#{id}-#{title}".parameterize
  end

  private
  
  def render_body
    require 'redcarpet'
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(PygmentizeHTML, extensions)
    self.rendered_body = redcarpet.render(self.body)
  end

  def check_for_default_category
    self.categories << Category::DEFAULT_CATEGORY if self.categories.empty?
  end
end

class PygmentizeHTML < Redcarpet::Render::HTML
  def block_code(code, language)
    require 'pygmentize'
    Pygmentize.process(code, language)
  end
end

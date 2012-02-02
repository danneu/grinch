class Post < ActiveRecord::Base
  attr_accessible :title, :body, :category_ids

  after_initialize :set_default_category
  before_save :render_body
  before_save :set_default_category
  before_save :prune_categories

  default_scope order('created_at DESC')
  has_and_belongs_to_many :categories

  validates :title, presence: true
  validates :body, presence: true

  def to_param; "#{id}-#{title}".parameterize; end
  def category_ids; self.categories.collect(&:id); end
  def build_categories(category_ids)
    category_ids.each do |id|
      self.categories << Category.find(id.to_i) 
    end
    self.categories = self.categories.uniq
  end

  private
  def set_default_category
    self.categories << Category::DEFAULT_CATEGORY.first
  end

  # Ensure no duplicate categories
  def prune_categories
    self.categories.uniq!
  end
  def render_body
    require 'redcarpet'
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(PygmentizeHTML, extensions)
    self.rendered_body = redcarpet.render(self.body)
  end
  def set_default_category
    self.categories << Category::DEFAULT_CATEGORY if self.categories.empty?
  end
end

class PygmentizeHTML < Redcarpet::Render::HTML
  def block_code(code, language)
    require 'pygmentize'
    Pygmentize.process(code, language)
  end
end

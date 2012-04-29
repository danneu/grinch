class Post < ActiveRecord::Base
  attr_accessible :title, :body, :category_ids, :rendered_body

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

  def render_body
    renderer = Renderer.new(text: self.body)
    self.rendered_body = renderer.to_html
  end

  private
  def set_default_category
    self.categories << Category::DEFAULT_CATEGORY.first
  end

  # Ensure no duplicate categories
  def prune_categories
    self.categories.uniq!
  end

  def set_default_category
    self.categories << Category::DEFAULT_CATEGORY if self.categories.empty?
  end

end


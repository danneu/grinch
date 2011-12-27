class Category < ActiveRecord::Base
  before_save :create_slug
  DEFAULT_NAME = "uncategorized"
  DEFAULT_CATEGORY = Category.where(name: DEFAULT_NAME)
  has_and_belongs_to_many :posts

  def to_param
    slug
  end

  private

  def create_slug
    self.slug = self.name.parameterize
  end
end

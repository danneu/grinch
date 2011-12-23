class Category < ActiveRecord::Base
  DEFAULT_NAME = "uncategorized"
  DEFAULT_CATEGORY = Category.where(name: DEFAULT_NAME)
  has_and_belongs_to_many :posts
end

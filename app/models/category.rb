class Category < ActiveRecord::Base
  DEFAULT = Category.find_by_name("unfiled")
  has_and_belongs_to_many :posts
end

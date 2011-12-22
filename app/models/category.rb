class Category < ActiveRecord::Base
  DEFAULT ||= Category.where(name: "unfiled") || Category.create(name: "unfiled")
  has_and_belongs_to_many :posts
end

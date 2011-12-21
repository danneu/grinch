class CreateCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :categories_posts do |t|
      t.integer :category_id
      t.integer :post_id
    end
  end
end

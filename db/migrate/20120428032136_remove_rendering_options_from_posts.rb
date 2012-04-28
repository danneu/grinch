class RemoveRenderingOptionsFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :rendering_options, :text
  end
end

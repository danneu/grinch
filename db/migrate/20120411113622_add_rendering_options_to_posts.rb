class AddRenderingOptionsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :rendering_options, :text

  end
end

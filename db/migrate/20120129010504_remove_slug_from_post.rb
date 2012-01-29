class RemoveSlugFromPost < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.remove :slug
    end
  end
end

ActiveAdmin.register Post do
  index do
    column :id
    column :title
    column :created_at
    column :categories
    default_actions
  end
end

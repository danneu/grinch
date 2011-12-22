ActiveAdmin.register Post do
  index do
    column :id
    column :title
    column :created_at
    default_actions
  end
end

ActiveAdmin.register Category do
  filter :name, as: :string
  index do
    column :id
    column :name
    default_actions
  end
end

ActiveAdmin.register Post do
  index do
    column :id
    column "Title" do |post|
      link_to post.title, admin_post_path(post)
    end
    column "Categories" do |post|
      # post.categories.count # Why won't this work?
      link_to post.categories.count, root_path
    end
    column :created_at
    default_actions
  end

  show do
    div class: "panel" do
      h3 post.title
      div class: "panel_contents" do
        h3 "Categories"
        post.categories.each do |cat|
          ul do
            li cat.name
          end
        end
        h3 "Markdown"
        pre post.body
        h3 "HTML"
        pre post.rendered_body
      end
    end
  end
  
  form do |f|
    f.inputs :title
    f.inputs :categories
    f.inputs :body
    f.buttons
  end
end

namespace :posts do
  desc "Regenerate rendered_body column (html) from the existing body (markdown)" 
  task :rerender => :environment do
    # OPTIMIZE: Call in batches if lots of posts
    Post.all.each do |post|
      print "Rerendering post '#{post.title}'..."
      puts post.update_attributes(rendered_body: post.render_body) ? "Done" : "Save failed"
    end
  end
end

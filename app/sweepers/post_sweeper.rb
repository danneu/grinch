class PostSweeper < ActionController::Caching::Sweeper
  observe :post

  def sweep(post)
    ActionController::Base.expire_page("/")
    expire_page(controller: "/posts", action: :show, id: post.to_param)
  end

  alias_method :after_create, :sweep
  alias_method :after_destroy, :sweep
  alias_method :after_update, :sweep

end

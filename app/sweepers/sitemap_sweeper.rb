class SitemapSweeper < ActionController::Caching::Sweeper
  observe :post

  def sweep(post)
    expire_page(sitemap_path)
  end

  alias_method :after_create, :sweep
  alias_method :after_destroy, :sweep

end

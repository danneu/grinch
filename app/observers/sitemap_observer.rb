class SitemapObserver < ActiveRecord::Observer
  observe :post

  def ping(post)
    SitemapPinger.ping
  end

  alias_method :after_create, :ping
  alias_method :after_destroy, :ping

end

class SitemapPinger 
  SEARCH_ENGINES = {
    google: "http://www.google.com/webmasters/tools/ping?sitemap=%s",
    ask: "http://submissions.ask.com/ping?sitemap=%s",
    bing: "http://www.bing.com/webmaster/ping.aspx?siteMap=%s"
  }

  def self.ping
    SitemapLogger.info Time.now
    SEARCH_ENGINES.each do |name, url|
      request = url % CGI.escape("#{GRINCH['root_url']}/sitemap.xml")  
      SitemapLogger.info "  Pinging #{name} with #{request}"
      if Rails.env == "production"
        response = Net::HTTP.get_response(URI.parse(request))
        SitemapLogger.info "    #{response.code}: #{response.message}"
        SitemapLogger.info "    Body: #{response.body}"

      end
    end
  end
end

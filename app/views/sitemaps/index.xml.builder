xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
  @static_paths.each do |path|
    xml.url do
      xml.loc "#{GRINCH['root_url']}#{path}"
      xml.changefreq("monthly")
    end
  end
  @posts.each do |post|
    xml.url do
      xml.loc "#{GRINCH['root_url']}#{url_for(post)}"
      xml.lastmod post.updated_at.strftime("%F")
      xml.changefreq("monthly")
    end
  end
end

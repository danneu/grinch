log_path = File.join(Rails.root, 'log/sitemap.log')
log_file = File.open(log_path, 'a')
log_file.sync = true
SitemapLogger = Logger.new(log_file)

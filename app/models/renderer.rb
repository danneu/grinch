require 'redcarpet'

class Renderer
  
  def initialize(options)
    @text = options[:text]
    @generate_toc = options[:generate_toc] || false
    @extensions = extensions
  end

  def to_html
    html_toc = Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC, extensions)
    markdown = Redcarpet::Markdown.new(PygmentizeHTML.new(renderer_options), extensions)
    toc  = html_toc.render(@text)
    html = markdown.render(@text)
    @generate_toc ? toc + html : html
  end

  private 

  def extensions
    {fenced_code_blocks:    true,
     no_intra_emphasis:     true}
  end

  def renderer_options
    {with_toc_data: true} 
  end
end

class PygmentizeHTML < Redcarpet::Render::HTML
  def block_code(code, language)
    require 'pygmentize'
    Pygmentize.process(code, language)
  end
end

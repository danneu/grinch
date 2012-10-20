require 'redcarpet'
require 'pygmentize'

class Renderer
  
  def initialize(options)
    @text = options[:text]
  end

  def to_html
    #renderer = PygmentizeHTML.new
    #toc_renderer = Redcarpet::Render::HTML_TOC.new
    renderer = PygmentizeHTML.new(renderer_extensions)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    #toc_markdown.render(@text) + markdown.render(@text)
    markdown.render(@text)
  end

  private 
  
  def renderer_extensions
    { with_toc_data: true }
  end

  def extensions
    { fenced_code_blocks: true, no_intra_emphasis: true }
  end

end

class CustomHTML_TOC < Redcarpet::Render::HTML_TOC
  def postprocess(full_document)
    full_document.gsub!("<ul>", "<ol>")
    full_document.gsub!("</ul>", "</ol>")
    %Q{
      <div id="table-of-contents">
      <h1>Table of Contents</h1>
      #{full_document}
      </div>
    }
  end
end

class PygmentizeHTML < Redcarpet::Render::HTML

  def preprocess(full_document)
    @loldoc = full_document
  end

  def block_code(code, language)
    Pygmentize.process(code, language)
  end

  def postprocess(full_document)
    toc_renderer = CustomHTML_TOC.new
    toc_markdown = Redcarpet::Markdown.new(toc_renderer)
    full_document.sub("@toc", toc_markdown.render(@loldoc.gsub(/(~{3}[^~]+~{3})/,"")))
  end
end

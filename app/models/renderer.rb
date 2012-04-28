require 'redcarpet'

class Renderer
  
  def initialize(options)
    @text = options[:text]
    @extensions = extensions
  end

  def to_html
    markdown = Redcarpet::Markdown.new(PygmentizeHTML.new, extensions)
    markdown.render(@text)
  end

  private 

  def extensions
    {fenced_code_blocks:    true,
     no_intra_emphasis:     true}
  end

end

class PygmentizeHTML < Redcarpet::Render::HTML
  def block_code(code, language)
    require 'pygmentize'
    Pygmentize.process(code, language)
  end
end

class ContentController < ApplicationController

  def convert
    text = params[:markdown]
    generate_toc = params[:generate_toc]
    renderer = Renderer.new(text: text, generate_toc: generate_toc)
    render text: renderer.to_html
  end

end

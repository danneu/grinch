class ContentController < ApplicationController

  def convert
    text = params[:markdown]
    renderer = Renderer.new(text: text)
    render text: renderer.to_html
  end

end

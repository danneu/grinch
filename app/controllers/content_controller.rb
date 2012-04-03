class ContentController < ApplicationController
  def convert
    require 'redcarpet'
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(PygmentizeHTML, extensions)
    render text: redcarpet.render(URI::decode(params[:markdown]))
  end
end

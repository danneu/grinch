class ContentController < ApplicationController
  before_filter :ensure_local

  def convert
    require 'redcarpet'
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(PygmentizeHTML, extensions)
    render text: redcarpet.render(URI::decode(params[:markdown]))
  end

  private
  def ensure_local
    return false unless request.local?
  end
end

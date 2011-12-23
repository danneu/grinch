class Post < ActiveRecord::Base
  attr_accessible :title, :body, :category_ids
  before_save :render_body, :check_for_default_category
  default_scope order('created_at DESC')
  has_and_belongs_to_many :categories

  private

  def render_body
    require 'rdiscount'
    require 'cgi'
    #new_body = coderay(CGI.unescapeHTML(self.body))
    new_body = coderay(self.body)
    logger.debug new_body
    self.rendered_body = RDiscount.new(new_body).to_html
  end

  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      CodeRay.scan($3, $2).div(:css => :class)
    end
  end

  def check_for_default_category
    self.categories << Category::DEFAULT_CATEGORY if self.categories.empty?
  end
end

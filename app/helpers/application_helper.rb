module ApplicationHelper
  def simple_date(date)
    date.strftime("%d %b %Y")
  end

  def admin_controller?
    @_controller.class.to_s =~ /Admin/
  end

  def gated_link_to(body, path, html_options = {})
    if admin_controller? 
      path = "/admin#{path}"
    end
    link_to(body, path, html_options = {})
  end

  def flash_messages
    messages = ""
    flash.each do |name, msg|
      messages << content_tag(:div, msg, id: "flash_#{name}")
    end
    messages.html_safe
  end
end

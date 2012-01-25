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

end

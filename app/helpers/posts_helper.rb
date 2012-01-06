module PostsHelper
  def disqus
    content_tag(:div, nil, id: "disqus_thread")
  end
end

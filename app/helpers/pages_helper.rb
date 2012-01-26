module PagesHelper
  def links_for(project)
    project.links.map {|anchor,url| link_to(anchor.to_s.humanize.downcase, url) }.to_sentence(two_words_connector: ", ", last_word_connector: ", ").html_safe 
  end
end

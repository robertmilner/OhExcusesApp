module ApplicationHelper
  
  # Returns the full title on a per-page basis.
  # From Rails Tutorial Sample App Second Edition
  def full_title(page_title)
    base_title = "Oh, Excuses"
    if page_title.empty?
      base_title
    elsif page_title == base_title
      "#{base_title} | An Excuse Generator"
    else
      "#{page_title} | #{base_title}"
    end
  end

end
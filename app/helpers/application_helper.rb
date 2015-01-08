module ApplicationHelper
  # Returns a full title for the application
  def full_title(page_title = '')
    base_title = "To-do App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Returns an og description
  def og_description(page_description = '')
    base_description = "A simple to-do list app made from rails"
    if page_description.empty?
      base_description
    else
      page_description
    end
  end

  private
end

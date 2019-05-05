module ApplicationHelper
	#Creates a method that allows each page on the website to have a unique title attached to it
  def full_title(page_title = '')
    base_title = "Quest"
    if page_title.empty?
      base_title
    else
      base_title + " | " + page_title
    end
  end

end

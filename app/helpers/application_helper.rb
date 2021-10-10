module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"

      # Note: book has this code instead:
      #
      #   page_title + base_title
      #
      # This fixes an over-escapinng problem but until I understand that
      # part I'll live with the over-escaping.
    end
  end
end

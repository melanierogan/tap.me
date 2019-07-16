module ApplicationHelper
  # def active_class(controller_name, action_name)
  #  "active" if current_page?(controller: controller_name, action: action_name)
  # end
  def nav_link(link_text, link_path)
  class_name = current_page?(link_path) ? 'current' : ''

  content_tag(:li, :class => class_name) do
    link_to link_text, link_path
  end
end
end

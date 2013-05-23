module ApplicationHelper
  def flash_message
    res = ''
    res += content_tag(:div, flash[:error],  :class => 'error') if flash[:error]
    res += content_tag(:div, flash[:alert],  :class => 'alert') if flash[:alert]
    res += content_tag(:div, flash[:notice], :class => 'success') if flash[:notice]
    return content_tag(:div, res.html_safe, :id => 'flash_message')
  end

  def language_selection
    res = [:en, :fr].map{ |l| link_to(l.to_s, "#{request.url.split('?').first}?new_locale=#{l.to_s}", :class => (I18n.locale == l ? 'selected' : '')) }.join(' | ')
    return res.html_safe.html_safe
  end

  def form_errors_for(object)
    res = ''
    if object.errors.any?
      res += "<div id='error_explanation'>"
      res += "<h2>#{ pluralize(object.errors.count, 'error')} prohibited this person from being saved:</h2>"
      res += "<ul>"
      object.errors.full_messages.each do |msg|
        res += "<li>#{ msg }</li>"
      end
      res += "</ul>"
      res += "</div>"
    end
    return res.html_safe
  end
end

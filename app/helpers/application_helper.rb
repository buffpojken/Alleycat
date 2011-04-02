module ApplicationHelper

  def session_meta_tags
    session_key = Rails.application.config.session_options[:key]
    %(<meta name="session-key" content="#{session_key}"/>\n<meta name="session-value" content="#{cookies[session_key]}"/>).html_safe
  end

end

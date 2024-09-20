Redmine::Plugin.register :custom_issue_style do
  name 'Custom Issue style'
  author 'Andrey Mats'
  description 'Позволяет переопределить стили отображения заявок из интерфейса Redmine'
  version '1.0.3'
  url 'https://github.com/amats6655'
  author_url 'https://t.me/amats'
  settings default: {'enable_styles' => 'true', 'display_mode' => 'admin_only'}, partial: 'settings/custom_issue_style_settings'
end

require_dependency 'custom_issue_style_hook_listener'

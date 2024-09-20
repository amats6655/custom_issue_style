class CustomIssueStyleHookListener < Redmine::Hook::ViewListener

  def view_issues_index_bottom(context = {})
    if Setting.plugin_custom_issue_style['enable_styles'] == 'true'
      display_mode = Setting.plugin_custom_issue_style['display_mode']
      if display_mode == 'all_users' || (display_mode == 'admin_only' && User.current.admin?)
        custom_field_id = 241
        if User.current.custom_field_value(custom_field_id) == '1'
          context[:controller].send(:render_to_string, {
            partial: 'issues/list_view',
            locals: context
          })
        else
          '' # Возвращаем пустую строку, если пользователь выключил новый интерфейс
        end
      else
        '' # Возвращаем пустую строку, если стили не должны отображаться
      end
    else
      '' # Возвращаем пустую строку, если стили отключены
    end
  end
  def view_issues_show_details_bottom(context = {})
    if Setting.plugin_custom_issue_style['enable_styles'] == 'true'
      display_mode = Setting.plugin_custom_issue_style['display_mode']
      if display_mode == 'all_users' || (display_mode == 'admin_only' && User.current.admin?)
        custom_field_id = 241
        if User.current.custom_field_value(custom_field_id) == '1'
          context[:controller].send(:render_to_string, {
            partial: 'issues/detail_view',
            locals: context
          })
        else
          '' # Возвращаем пустую строку, если пользователь выключил новый интерфейс
        end
      else
        '' # Возвращаем пустую строку, если стили не должны отображаться
      end
    else
      '' # Возвращаем пустую строку, если стили отключены
    end
  end
  def view_issues_form_details_bottom(context = {})
    if Setting.plugin_custom_issue_style['enable_styles'] == 'true'
      display_mode = Setting.plugin_custom_issue_style['display_mode']
      if display_mode == 'all_users' || (display_mode == 'admin_only' && User.current.admin?)
        custom_field_id = 241
        if User.current.custom_field_value(custom_field_id) == '1'
          context[:controller].send(:render_to_string, {
            partial: 'issues/detail_view',
            locals: context
          })
        else
          '' # Возвращаем пустую строку, если пользователь выключил новый интерфейс
        end
      else
        '' # Возвращаем пустую строку, если стили не должны отображаться
      end
    else
      '' # Возвращаем пустую строку, если стили отключены
    end
  end
end
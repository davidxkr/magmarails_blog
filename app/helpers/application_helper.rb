module ApplicationHelper
  def link_for_user_login_or_logout
    if current_user
      link_to t('views.post.log_out'), destroy_user_session_path, :method => :delete 
    else
      link_to t('views.post.log_in'), new_user_session_path
    end
  end
end

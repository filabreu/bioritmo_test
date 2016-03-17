module ApplicationHelper

  def user_links
    render('shared/user_links') if current_user
  end
end

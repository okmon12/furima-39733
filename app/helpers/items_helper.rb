module ItemsHelper
  def same_user?(current_user, item)
    current_user == item.user
  end
end

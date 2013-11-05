ActiveAdmin.register Store do
  menu :priority => 3, :label =>"Store"
  def active_admin_collection
    super.accessible_by current_ability
  end
end

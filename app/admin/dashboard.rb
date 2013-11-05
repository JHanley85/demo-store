ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span
          h1 "Welcome to Easy"
        span
          h5 "It\'s that easy."
      end
    end
    columns do
     column do
         panel "New Products" do
           ul do
             current_user.products.map do |product|
               li link_to(product.title, admin_products_path(product))
             end
           end
         end
     end
     column do
       panel "Recent Orders" do
         table do
           current_user.products.map do |product|
             tr
              td "random-#{rand(0-100)}@example.com"
              td link_to(product.title, admin_products_path(product))
              td rand(0..5)
           end
         end
       end
     end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
     end
  end # content
end

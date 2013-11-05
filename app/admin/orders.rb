ActiveAdmin.register_page "Orders" do
  menu :priority => 3, :label => "Orders"

  content :title => "Orders" do

    columns do
      column do
        para do
          "Here's a spot for Orders, when available."
        end
      end
    end
  end

end

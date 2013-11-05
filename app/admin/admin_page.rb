ActiveAdmin.register_page "Analytics" do
  menu :priority => 2, :label => "Analytics"

  content :title => "Analytics" do

      columns do
        column do
          para do
            "Here's a spot for Analytics."
          end
        end
      end
    end

end

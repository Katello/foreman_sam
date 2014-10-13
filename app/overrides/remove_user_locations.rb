
# Remove the Location tab
Deface::Override.new(:virtual_path => 'users/_form',
                     :name => 'remove_location_tab',
                     :remove => 'code[erb-silent]:contains("if show_location_tab")',
                     :closing_selector => "code[erb-silent]:contains('end')"
                     )

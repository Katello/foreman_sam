Deface::Override.new(:virtual_path => 'home/_location_dropdown',
                     :name => 'remove_context_locations',
                     :remove => 'li'
                     )
Deface::Override.new(:virtual_path => 'home/_org_switcher',
                     :name => 'remove_context_divider',
                     :remove => 'code[erb-loud]:contains("divider")'
                     )

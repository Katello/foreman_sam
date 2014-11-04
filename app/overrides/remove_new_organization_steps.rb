# Remove the message when there are hosts that do not belong to an organization
Deface::Override.new(:virtual_path => 'taxonomies/_step1',
                     :name => 'remove_step2',
                     :replace => 'code[erb-loud]:contains("wizard_header")',
                     :text => '<%= wizard_header 1, _("Create %s") % taxonomy.class.name, _("Edit Properties") %>'
                     )

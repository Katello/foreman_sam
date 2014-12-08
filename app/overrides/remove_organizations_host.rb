# Remove the message when there are hosts that do not belong to an organization
Deface::Override.new(
  :virtual_path => 'taxonomies/index',
  :name => 'remove_unassigned_hosts',
  :remove => 'code[erb-silent]:contains("if @count_nil_hosts > 0")',
  :closing_selector => "code[erb-silent]:contains('end')"
)

# Remove "Mismatches Report" and "Help"
Deface::Override.new(
  :virtual_path => 'taxonomies/index',
  :name => 'remove_title_actions',
  :replace => 'code[erb-silent]:contains("title_actions")',
  :text => '<% title_actions display_link_if_authorized((_("New %s") % taxonomy_title), hash_for_new_taxonomy_path)%>'
)

# Remove the host count column and limit action choices
# This is cut&paste from original erb, then remove code
Deface::Override.new(
  :virtual_path => 'taxonomies/index',
  :name => 'remove_hosts_count',
  :replace_contents => 'table',
  :partial => '../overrides/foreman/taxonomies/organization_table'
)

# Remove all the relations from org edit except users
# This is cut&paste from original erb, then remove code
Deface::Override.new(
  :virtual_path => 'taxonomies/_form',
  :name => 'remove_org_relations',
  :replace => 'div.form-group',
  :partial => '../overrides/foreman/taxonomies/organization_edit'
)

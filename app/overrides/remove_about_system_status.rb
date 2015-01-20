Deface::Override.new(
  :virtual_path => 'about/index',
  :name => 'remove_about_system_status',
  :replace => 'div.col-md-7:first',
  :partial => '../overrides/foreman/about/sam_system_status'
)

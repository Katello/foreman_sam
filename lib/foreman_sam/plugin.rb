Foreman::Plugin.register :foreman_sam do
  requires_foreman '> 1.6'

  delete_menu_item :top_menu, :dashboard
  delete_menu_item :top_menu, :reports
  delete_menu_item :top_menu, :fact_values
  delete_menu_item :top_menu, :statistics
  delete_menu_item :top_menu, :trends

  delete_menu_item :top_menu, :content_views
  delete_menu_item :top_menu, :environments
  delete_menu_item :top_menu, :gpg_keys

  delete_menu_item :top_menu, :containers
  delete_menu_item :top_menu, :new_container

  delete_menu_item :top_menu, :hosts
  delete_menu_item :top_menu, :newhost
  delete_menu_item :top_menu, :operatingsystems
  delete_menu_item :top_menu, :config_templates
  delete_menu_item :top_menu, :ptables
  delete_menu_item :top_menu, :media
  delete_menu_item :top_menu, :models
  delete_menu_item :top_menu, :architectures

  delete_menu_item :top_menu, :hostgroups
  delete_menu_item :top_menu, :common_parameters
  delete_menu_item :top_menu, :environments
  delete_menu_item :top_menu, :puppetclasses
  delete_menu_item :top_menu, :config_groups
  delete_menu_item :top_menu, :lookup_keys

  delete_menu_item :top_menu, :smart_proxies
  delete_menu_item :top_menu, :compute_resources
  delete_menu_item :top_menu, :compute_profiles
  delete_menu_item :top_menu, :subnets
  delete_menu_item :top_menu, :domains
  delete_menu_item :top_menu, :realms

  delete_menu_item :admin_menu, :locations
  delete_menu_item :admin_menu, :bookmarks
end

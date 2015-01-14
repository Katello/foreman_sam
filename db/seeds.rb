
Role.without_auditing do
  ['Manager',
   'Edit partition tables',
   'View hosts',
   'Edit hosts',
   'Viewer',
   'Site manager'
  ].each do |name|
    role = Role.find_by_name(name)
    role.destroy if role
  end

  undesired_filters = %w(
    Architecture
    Bookmark
    CommonParameter
    ComputeProfile
    ComputeResource
    ConfigGroup
    Domain
    Environment
    FactValue
    Hostgroup
    HostClass
    Host
    Image
    LookupKey
    Medium
    Model
    Operatingsystem
    Parameter
    Ptable
    ConfigTemplate
    Puppetclass
    Realm
    Report
    SmartProxy
    Subnet
    Trend
  )
  Filter.all.each do |filter|
    filter.destroy if undesired_filters.include?(filter.resource_type)
  end

  undesired_permissions = %w(
    # katello
    create_content_views
    edit_content_views
    destroy_content_views
    publish_content_views
    promote_or_remove_content_views
    create_lifecycle_environments
    edit_lifecycle_environments
    destroy_lifecycle_environments
    promote_or_remove_content_views_to_environments
    view_gpg_keys
    create_gpg_keys
    edit_gpg_keys
    destroy_gpg_keys
    create_products
    edit_products
    destroy_products
    # foreman
    view_architectures
    create_architectures
    edit_architectures
    destroy_architectures
    view_bookmarks
    create_bookmarks
    edit_bookmarks
    destroy_bookmarks
    view_compute_profiles
    create_compute_profiles
    edit_compute_profiles
    destroy_compute_profiles
    view_compute_resources
    create_compute_resources
    edit_compute_resources
    destroy_compute_resources
    view_compute_resources_vms
    create_compute_resources_vms
    edit_compute_resources_vms
    destroy_compute_resources_vms
    power_compute_resources_vms
    console_compute_resources_vms
    view_templates
    create_templates
    edit_templates
    destroy_templates
    deploy_templates
    lock_templates
    view_config_groups
    create_config_groups
    edit_config_groups
    destroy_config_groups
    view_domains
    create_domains
    edit_domains
    destroy_domains
    view_environments
    create_environments
    edit_environments
    destroy_environments
    import_environments
    view_external_usergroups
    create_external_usergroups
    edit_external_usergroups
    destroy_external_usergroups
    view_external_variables
    create_external_variables
    edit_external_variables
    destroy_external_variables
    view_facts upload_facts
    view_globals
    create_globals
    edit_globals
    destroy_globals
    edit_classes
    create_params
    edit_params
    destroy_params
    view_hostgroups
    create_hostgroups
    edit_hostgroups
    destroy_hostgroups
    view_hosts
    create_hosts
    edit_hosts
    destroy_hosts
    build_hosts
    power_hosts
    console_hosts
    ipmi_boot
    puppetrun_hosts
    view_images
    create_images
    edit_images
    destroy_images
    view_media
    create_media
    edit_media
    destroy_media
    view_models
    create_models
    edit_models
    destroy_models
    view_operatingsystems
    create_operatingsystems
    edit_operatingsystems
    destroy_operatingsystems
    view_ptables
    create_ptables
    edit_ptables
    destroy_ptables
    view_puppetclasses
    create_puppetclasses
    edit_puppetclasses
    destroy_puppetclasses
    import_puppetclasses
    view_realms
    create_realms
    edit_realms
    destroy_realms
    view_reports
    destroy_reports
    upload_reports
    view_smart_proxies
    create_smart_proxies
    edit_smart_proxies
    destroy_smart_proxies
    view_smart_proxies_autosign
    create_smart_proxies_autosign
    destroy_smart_proxies_autosign
    view_smart_proxies_puppetca
    edit_smart_proxies_puppetca
    destroy_smart_proxies_puppetca
    view_statistics
    view_subnets
    create_subnets
    edit_subnets
    destroy_subnets
    import_subnets
    view_trends
    create_trends
    edit_trends
    destroy_trends
    update_trends
    # containers plugin
    view_containers
    commit_containers
    create_containers
    destroy_containers
    view_registries
    create_registries
    destroy_registries
  )
  Permission.all.each do |permission|
    permission.destroy if undesired_permissions.include? permission.name
  end
end

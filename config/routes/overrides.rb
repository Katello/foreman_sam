#
# Copyright 2014 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.

Foreman::Application.routes.draw do
  root :to => 'katello/dashboard#index'
  match '/dashboard', :to => 'katello/dashboard#index'

  # foreman
  match 'architectures(/*post)', :to => proc { [404, {}, ['']] }
  match '*all/architectures(/*all)', :to => proc { [404, {}, ['']] }
  match 'bookmarks(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/bookmarks(/*post)', :to => proc { [404, {}, ['']] }
  match 'compute_profiles(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/compute_profiles(/*post)', :to => proc { [404, {}, ['']] }
  match 'config_templates(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/config_templates(/*post)', :to => proc { [404, {}, ['']] }
  match 'domains(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/domains(/*post)', :to => proc { [404, {}, ['']] }
  match 'hostgroups(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/hostgroups(/*post)', :to => proc { [404, {}, ['']] }
  match 'hosts(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/hosts(/*post)', :to => proc { [404, {}, ['']] }
  match 'media(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/media(/*post)', :to => proc { [404, {}, ['']] }
  match 'operatingsystems(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/operatingsystems(/*post)', :to => proc { [404, {}, ['']] }
  match 'ptables(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/ptables(/*post)', :to => proc { [404, {}, ['']] }
  match 'smart_proxies(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/smart_proxies(/*post)', :to => proc { [404, {}, ['']] }
  match 'smart_variables(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/smart_variables(/*post)', :to => proc { [404, {}, ['']] }
  match 'subnets(/*post)', :to => proc { [404, {}, ['']] }
  match '*pre/subnets(/*post)', :to => proc { [404, {}, ['']] }

  # katello
  match '*all/gpg_keys(/*all)', :to => proc { [404, {}, ['']] }
  match '*all/products', :via => :post, :to => proc { [404, {}, ['']] }
  match '*all/content_views', :via => :post, :to => proc { [404, {}, ['']] }
  match '*all/content_views/*all', :via => :put, :to => proc { [404, {}, ['']] }
  match '*all/environments', :via => :post, :to => proc { [404, {}, ['']] }
  match '*all/environments/*all', :via => :put, :to => proc { [404, {}, ['']] }
end

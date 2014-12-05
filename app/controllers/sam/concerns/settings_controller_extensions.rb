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

module SAM
  module Concerns
    module SettingsControllerExtensions
      extend ActiveSupport::Concern

      included do
        def index
          all_settings = Setting.live_descendants.search_for(params[:search])
          @settings = []
          [:administrator,
           :authorize_login_delegation,
           :authorize_login_delegation_api,
           :db_pending_migration,
           :db_pending_seed,
           :email_reply_address,
           :entries_per_page,
           :fix_db_cache,
           :foreman_url,
           :idle_timeout,
           :send_welcome_email,
           :use_gravatar].each do |setting|
            @settings += all_settings.where(:category => Setting::General, :name => setting)
          end

          [:authorize_login_delegation_auth_source_user_autocreate,
           :login_delegation_logout_url,
           :oauth_active,
           :oauth_consumer_key,
           :oauth_consumer_secret,
           :oauth_map_users].each do |setting|
            @settings += all_settings.where(:category => Setting::Auth, :name => setting)
          end

          @settings += all_settings.where(:category => Setting::ForemanTasks, :name => :dynflow_console_require_auth)
          @settings += all_settings.where(:category => Setting::ForemanTasks, :name => :dynflow_enable_console)

          @settings
        end
      end
    end
  end
end

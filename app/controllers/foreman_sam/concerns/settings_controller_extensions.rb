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

module ForemanSAM
  module Concerns
    module SettingsControllerExtensions
      extend ActiveSupport::Concern

      included do
        def index
          all_settings = Setting.live_descendants.search_for(params[:search])
          @settings = []
          @settings += all_settings.where(:category => Setting::General, :name => :administrator)
          @settings += all_settings.where(:category => Setting::General, :name => :authorize_login_delegation)
          @settings += all_settings.where(:category => Setting::General, :name => :authorize_login_delegation_api)
          @settings += all_settings.where(:category => Setting::General, :name => :db_pending_migration)
          @settings += all_settings.where(:category => Setting::General, :name => :db_pending_seed)
          @settings += all_settings.where(:category => Setting::General, :name => :email_reply_address)
          @settings += all_settings.where(:category => Setting::General, :name => :entries_per_page)
          @settings += all_settings.where(:category => Setting::General, :name => :fix_db_cache)
          @settings += all_settings.where(:category => Setting::General, :name => :foreman_url)
          @settings += all_settings.where(:category => Setting::General, :name => :idle_timeout)
          @settings += all_settings.where(:category => Setting::General, :name => :send_welcome_email)
          @settings += all_settings.where(:category => Setting::General, :name => :use_gravatar)

          @settings += all_settings.where(:category => Setting::Auth, :name => :authorize_login_delegation_auth_source_user_autocreate)
          @settings += all_settings.where(:category => Setting::Auth, :name => :login_delegation_logout_url)
          @settings += all_settings.where(:category => Setting::Auth, :name => :oauth_active)
          @settings += all_settings.where(:category => Setting::Auth, :name => :oauth_consumer_key)
          @settings += all_settings.where(:category => Setting::Auth, :name => :oauth_consumer_secret)
          @settings += all_settings.where(:category => Setting::Auth, :name => :oauth_map_users)

          @settings += all_settings.where(:category => Setting::ForemanTasks, :name => :dynflow_console_require_auth)
          @settings += all_settings.where(:category => Setting::ForemanTasks, :name => :dynflow_enable_console)

          @settings
        end
      end
    end
  end
end


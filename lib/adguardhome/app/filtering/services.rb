# frozen_string_literal: true

require 'adguardhome/app/base'
require 'adguardhome/app/filtering/services/list'
require 'adguardhome/app/filtering/services/block'
require 'adguardhome/app/filtering/services/unblock'

module AdGuardHome
  module App
    module Filtering
      class ServicesCommand < AdGuardHome::App::BaseCommand
        subcommand 'block', 'block a service', AdGuardHome::App::Filtering::Services::BlockCommand
        subcommand 'unblock', 'unblock a service', AdGuardHome::App::Filtering::Services::UnblockCommand
        subcommand 'list', 'list blocked services', AdGuardHome::App::Filtering::Services::ListCommand
      end
    end
  end
end

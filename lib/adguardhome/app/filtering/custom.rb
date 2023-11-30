# frozen_string_literal: true

require 'adguardhome/app/base'
require 'adguardhome/app/filtering/custom/add'
require 'adguardhome/app/filtering/custom/list'
require 'adguardhome/app/filtering/custom/remove'

module AdGuardHome
  module App
    module Filtering
      class CustomCommand < AdGuardHome::App::BaseCommand
        subcommand 'add', 'add custom filter', AdGuardHome::App::Filtering::Custom::AddCommand
        subcommand 'list', 'list custom filters', AdGuardHome::App::Filtering::Custom::ListCommand
        subcommand 'remove', 'remove custom filter', AdGuardHome::App::Filtering::Custom::RemoveCommand
      end
    end
  end
end

# frozen_string_literal: true

require 'adguardhome/app/base'
require 'adguardhome/app/stats/blockeddomains'
require 'adguardhome/app/stats/clients'
require 'adguardhome/app/stats/domains'
require 'adguardhome/app/stats/general'
require 'adguardhome/app/stats/upstreams'

module AdGuardHome
  module App
    class StatsCommand < AdGuardHome::App::BaseCommand
      subcommand 'general', 'show general stats', AdGuardHome::App::Stats::GeneralCommand
      subcommand 'blocked', 'show top blocked domains', AdGuardHome::App::Stats::BlockedDomainsCommand
      subcommand 'clients', 'show top clients', AdGuardHome::App::Stats::ClientsCommand
      subcommand 'domains', 'show top domains', AdGuardHome::App::Stats::DomainsCommand
      subcommand 'upstreams', 'show upstreams stats', AdGuardHome::App::Stats::UpstreamsCommand
    end
  end
end

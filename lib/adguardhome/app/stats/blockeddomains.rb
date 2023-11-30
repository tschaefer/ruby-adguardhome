# frozen_string_literal: true

require 'adguardhome/app/stats/base'

module AdGuardHome
  module App
    module Stats
      class BlockedDomainsCommand < AdGuardHome::App::Stats::BaseCommand
        def initialize(*args)
          super(args)

          @stats = 'top_blocked_domains'
          @header = 'DOMAIN'
        end
      end
    end
  end
end

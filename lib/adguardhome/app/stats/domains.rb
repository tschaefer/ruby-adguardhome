# frozen_string_literal: true

require 'adguardhome/app/stats/base'

module AdGuardHome
  module App
    module Stats
      class DomainsCommand < AdGuardHome::App::Stats::BaseCommand
        def initialize(*args)
          super(args)

          @stats = 'top_queried_domains'
          @header = 'DOMAIN'
        end
      end
    end
  end
end

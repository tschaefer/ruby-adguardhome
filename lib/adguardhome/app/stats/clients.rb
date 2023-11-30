# frozen_string_literal: true

require 'adguardhome/app/stats/base'

module AdGuardHome
  module App
    module Stats
      class ClientsCommand < AdGuardHome::App::Stats::BaseCommand
        def initialize(*args)
          super(args)

          @stats = 'top_clients'
          @header = 'CLIENT'
        end
      end
    end
  end
end

# frozen_string_literal: true

require 'json'

require 'clamp'
require 'pastel'

require 'adguardhome'

module AdGuardHome
  module App
    class BaseCommand < Clamp::Command
      option ['-v', '--version'], :flag, 'show version' do
        puts "adguardhomectl #{AdGuardHome::VERSION}"
        exit 0
      end

      private

      def bailout(message)
        puts Pastel.new.red.bold(message)
        exit 1
      end

      def configure
        file = ENV['ADGUARDHOMERC'] || File.join(Dir.home, '.adguardhomerc')
        begin
          settings = JSON.load_file(file)
        rescue StandardError => e
          bailout(e.message)
        end

        AdGuardHome.configure do |config|
          config.base_url = settings['url']
          config.username = settings['username']
          config.password = settings['password']
        end
      end
    end
  end
end

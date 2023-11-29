# frozen_string_literal: true

require 'adguardhome/agent'

require 'adguardhome/access'
require 'adguardhome/apple/mobileconfig'
require 'adguardhome/blockedservices'
require 'adguardhome/clients'
require 'adguardhome/common'
require 'adguardhome/dhcp'
require 'adguardhome/dns'
require 'adguardhome/filtering'
require 'adguardhome/parental'
require 'adguardhome/querylog'
require 'adguardhome/rewrite'
require 'adguardhome/safebrowsing'
require 'adguardhome/stats'
require 'adguardhome/tls'
require 'adguardhome/version'

module AdGuardHome
  class << self
    def configure
      @agent ||= AdGuardHome::Agent.new
      yield @agent

      @configured = true
    end

    def configured?
      @configured.nil? ? false : @configured
    end

    def configured!
      raise 'AdGuardHome is not configured!' if !configured?

      true
    end

    def reset!
      @agent = nil
      @configured = nil
    end

    def access
      configured!
      AdGuardHome::Access.agent = @agent

      AdGuardHome::Access
    end

    def blocked_services
      configured!
      AdGuardHome::BlockedServices.agent = @agent

      AdGuardHome::BlockedServices
    end

    def clients
      configured!
      AdGuardHome::Clients.agent = @agent

      AdGuardHome::Clients
    end

    def common
      configured!
      AdGuardHome::Common.agent = @agent

      AdGuardHome::Common
    end

    def dhcp
      configured!
      AdGuardHome::DHCP.agent = @agent

      AdGuardHome::DHCP
    end

    def dns
      configured!
      AdGuardHome::DNS.agent = @agent

      AdGuardHome::DNS
    end

    def filtering
      configured!
      AdGuardHome::Filtering.agent = @agent

      AdGuardHome::Filtering
    end

    def mobileconfig
      configured!
      AdGuardHome::Apple::Mobileconfig.agent = @agent

      AdGuardHome::Apple::Mobileconfig
    end

    def parental
      configured!
      AdGuardHome::Parental.agent = @agent

      AdGuardHome::Parental
    end

    def querylog
      configured!
      AdGuardHome::Querylog.agent = @agent

      AdGuardHome::Querylog
    end

    def rewrite
      configured!
      AdGuardHome::Rewrite.agent = @agent

      AdGuardHome::Rewrite
    end

    def safebrowsing
      configured!
      AdGuardHome::Safebrowsing.agent = @agent

      AdGuardHome::Safebrowsing
    end

    def stats
      configured!
      AdGuardHome::Stats.agent = @agent

      AdGuardHome::Stats
    end

    def tls
      configured!
      AdGuardHome::TLS.agent = @agent

      AdGuardHome::TLS
    end
  end
end

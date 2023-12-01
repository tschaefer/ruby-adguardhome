# frozen_string_literal: true

require 'httparty'

module AdGuardHome
  class Agent
    include HTTParty
    headers 'Content-Type' => 'application/json', Accept: 'application/json'
    debug_output $stdout if ENV['ADGUARDHOME_DEBUG']

    attr_accessor :base_url, :username, :password

    def initialize
      @base_url = 'http://localhost:3000'
      @username = 'admin'
      @password = 'admin'
    end

    %i[get post put delete].each do |method|
      define_method(method) do |path, params: {}|
        request(method, path, params:)
      end
    end

    def request(method, path, params: {})
      params[:headers] ||= {}
      auth = { username:, password: }

      response = self.class.send(
        method,
        "#{base_url}/control#{path}",
        basic_auth: auth,
        body: params[:body],
        headers: params[:headers],
        query: params[:query]
      )

      raise response.body if !response.code.between?(200, 299)

      response.parsed_response
    end
  end
end

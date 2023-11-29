# frozen_string_literal: true

module AdGuardHome
  module Rewrite
    class << self
      attr_writer :agent

      ##
      # Get list of rewrite rules.
      def list
        @agent.get('/rewrite/list')
      end

      ##
      # Add a new rewrite rule.
      #
      #   {
      #     domain: '<string>',
      #     answer: '<string>',
      #   }
      def add(attributes)
        @agent.post('/rewrite/add', params: { body: attributes.to_json })
      end

      ##
      # Delete a rewrite rule.
      #
      #   {
      #     domain: '<string>',
      #     answer: '<string>',
      #   }
      def delete(attributes)
        @agent.post('/rewrite/delete', params: { body: attributes.to_json })
      end

      ##
      # Update a rewrite rule.
      #   {
      #     target: {
      #       domain: '<string>',
      #       answer: '<string>',
      #     },
      #     update: {
      #       domain: '<string>',
      #       answer: '<string>',
      #     }
      #   }
      def update(attributes)
        @agent.put('/rewrite/update', params: { body: attributes.to_json })
      end
    end
  end
end

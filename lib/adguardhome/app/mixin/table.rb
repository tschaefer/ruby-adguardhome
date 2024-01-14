# frozen_string_literal: true

require 'tty-screen'
require 'tty-pager'
require 'tty-table'

module AdGuardHome
  module App
    module Mixin
      module Table
        private

        def legend(msg)
          return "\n" if !legend?

          "\n\n#{msg}\n"
        end

        def pager(content)
          enabled = pager?

          if pager? &&
             (content.lines.size <= TTY::Screen.height &&
              content.lines.map(&:size).max <= TTY::Screen.width)
            enabled = false
          end

          TTY::Pager.new(enabled:).page(content)
        end

        def render(header, rows)
          table = TTY::Table.new(header, rows)

          table.render(multiline: true, width: 2**16) do |renderer|
            renderer.border do
              mid '─'
              mid_mid '─'
              center ' '
            end
          end
        end
      end
    end
  end
end

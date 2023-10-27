# frozen_string_literal: true

require_relative './base_input'

module HexletCode
  module Inputs
    class InputText < BaseInput
      def self.create(attributes)
        common_attributes = { tag: 'textarea', cols: 20, rows: 40 }
        super(common_attributes.merge(attributes))
      end
    end
  end
end

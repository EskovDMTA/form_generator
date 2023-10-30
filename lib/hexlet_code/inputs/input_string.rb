# frozen_string_literal: true

require_relative './base_input'
module HexletCode
  module Inputs
    class InputString < BaseInput
      def self.create(attributes)
        common_attributes = { tag: 'input', type: 'text' }
        super(attributes.merge(common_attributes))
      end
    end
  end
end

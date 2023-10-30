# frozen_string_literal: true

require_relative 'base_input'
module HexletCode
  module Inputs
    class InputSubmit < BaseInput
      def self.create(attributes)
        common_attributes = { tag: input, type: 'submit' }
        super(common_attributes.merge(attributes))
      end
    end
  end
end

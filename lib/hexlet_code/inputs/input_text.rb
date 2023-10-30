# frozen_string_literal: true

require_relative 'base_input'

module HexletCode
  module Inputs
    class InputText < BaseInput
      def self.create(attributes)
        common_attributes = { tag: 'textarea', cols: 20, rows: 40 }
        attributes[:content] = attributes.delete(:value)
        attributes.delete(:type)
        super(attributes.merge(common_attributes))
      end
    end
  end
end

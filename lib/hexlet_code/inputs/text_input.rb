# frozen_string_literal: true

require_relative 'base_input'

module HexletCode
  module Inputs
    class TextInput < BaseInput
      def input
        common_attributes = { tag: 'textarea', cols: 20, rows: 40 }
        @input[:content] = @input.delete(:value)
        @input.delete(:type)
        input_attributes = @input.merge(common_attributes)
        HexletCode::Tag.build(input_attributes[:tag], input_attributes.except(:tag))
      end
    end
  end
end

# frozen_string_literal: true

module HexletCode
  module Inputs
    autoload(:BaseInput, 'hexlet_code/inputs/base_input')
    class TextInput < BaseInput
      COLS = 20
      ROWS = 40

      def input
        common_attributes = { tag: 'textarea', cols: COLS, rows: ROWS }
        @input[:content] = @input.delete(:value)
        @input.delete(:type)
        input_attributes = @input.merge(common_attributes)
        HexletCode::Tag.build(input_attributes[:tag], input_attributes.except(:tag))
      end
    end
  end
end

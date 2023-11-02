# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def input
        common_attributes = { tag: 'input', type: 'text' }
        input_attributes = @input.merge(common_attributes)
        HexletCode::Tag.build(input_attributes[:tag], input_attributes.except(:tag))
      end
    end
  end
end

# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      autoload(:HexletCode, 'hexlet_code/tag')
      def initialize(input)
        @input = input.except(:label)
        @label = input[:label]
      end

      def label
        HexletCode::Tag.build('label', @label)
      end

      def input
        raise NotImplementedError
      end

      def render
        label + input
      end
    end
  end
end

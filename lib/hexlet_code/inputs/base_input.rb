# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      attr_accessor :attributes

      def initialize(attributes)
        @attributes = attributes
      end

      def self.create(attributes)
        new(attributes)
      end
    end
  end
end

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

    class Input < BaseInput
      def self.create(attributes)
        common_attributes = {cols: BASE_COLS, rows: BASE_ROWS }
        super(common_attributes.merge(attributes))
      end
    end

    class InputText < BaseInput
      TAG_NAME = 'textarea'
      BASE_COLS = 20
      BASE_ROWS = 40

      def self.create(attributes)
        common_attributes = { tag: TAG_NAME, cols: BASE_COLS, rows: BASE_ROWS }
        super(common_attributes.merge(attributes))
      end
    end

    class InputSubmit < BaseInput
      TAG_NAME = 'input'
      TYPE = 'submit'
      def self.create(attributes)
        common_attributes = { tag: TAG_NAME, type: 'submit' }
        super(common_attributes.merge(attributes))
      end
    end
  end
end

# frozen_string_literal: true

require_relative "paired_tags"
# autoload("HexletCode", "lib/hexlet/hexlet-code/hexlet_code")
module HexletCode
  class Tag
    class << self
      def build(tag_name, attributes = {})
        tag_body = yield if block_given?
        "<#{tag_name}#{parsing_attributes(attributes)}>#{tag_body || ""}#{paired_tag?(tag_name)}"
      end

      def parsing_attributes(attributes = {})
        attributes.map { |key, value| " #{key}=\"#{value}\"" }.join("")
      end

      def paired_tag?(tag_name)
        PAIRED_TAGS.include?(tag_name) ? "</#{tag_name}>" : ""
      end
    end
  end
end

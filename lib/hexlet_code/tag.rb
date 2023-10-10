# frozen_string_literal: true

require_relative 'paired_tags/paired_tags'

module HexletCode
  class Tag
    class << self
      def build(tag_name, attributes = {}, content = '')
        tag_body = yield if block_given?
        content = "\n#{content}" if tag_name == 'form'
        "<#{tag_name}#{parsing_attributes(attributes)}>#{tag_body || content || ''}#{paired_tag?(tag_name)}\n"
      end

      def parsing_attributes(attributes = {})
        attributes.map { |key, value| " #{key}=\"#{value}\"" }.join
      end

      def paired_tag?(tag_name)
        PAIRED_TAGS.include?(tag_name) ? "</#{tag_name}>" : ''
      end
    end
  end
end

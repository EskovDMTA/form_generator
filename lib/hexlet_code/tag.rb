# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[input img br].freeze
    TABULATION = '    '

    class << self
      def build(tag, attributes = {})
        "#{TABULATION}<#{tag}#{parsing_attributes(attributes.except(:content))}>#{block_given? ? yield : attributes[:content]}#{paired_tag(tag)}\n"
      end

      def parsing_attributes(attributes = {})
        return '' if attributes.empty?

        attributes.map { |key, value| " #{key}=\"#{value}\"" }.join
      end

      def paired_tag(tag_name)
        SINGLE_TAGS.include?(tag_name) ? '' : "</#{tag_name}>"
      end
    end
  end
end

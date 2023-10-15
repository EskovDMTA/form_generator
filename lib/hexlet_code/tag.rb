# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[form input img br].freeze
    TABULATION = '    '

    class << self
      def build(tag, attributes = {})
        content = block_given? ? yield : attributes[:content]
        tab = tag == 'form' ? '' : TABULATION
        only_tag_attributes = attributes.except(:content)
        "#{tab}<#{tag}#{parsing_attributes(only_tag_attributes)}>#{content}#{paired_tag(tag)}\n"
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

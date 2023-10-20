# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[input img br].freeze

    class << self
      def build(tag, attributes = {})
        # content = block_given? ? yield : attributes[:content]
        # tab = tag == 'form' ? '' : TABULATION
        # only_tag_attributes = attributes.except(:content)
        # "#{tab}<#{tag}#{parsing_attributes(only_tag_attributes)}>#{content}#{paired_tag(tag)}\n"
        tag_attributes = parsing_attributes(attributes)
        return "<#{tag}#{tag_attributes}>" if SINGLE_TAGS.include?(tag)
        content = block_given? ? yield : ""
        "<#{tag}#{tag_attributes}>#{content}</#{tag}>"
      end

      def parsing_attributes(attributes = {})
        return '' if attributes.empty?

        build_attrs = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
        [' ', build_attrs].join
      end
      # def paired_tag(tag_name)
      #   SINGLE_TAGS.include?(tag_name) ? '' : "</#{tag_name}>"
      # end
    end
  end
end

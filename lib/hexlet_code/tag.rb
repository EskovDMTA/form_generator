# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[input img br].freeze

    def self.build(tag, attributes = {})
      tag_attributes = parsing_attributes(attributes)
      return "<#{tag}#{tag_attributes}>\n" if SINGLE_TAGS.include?(tag)

      content = block_given? ? yield : attributes.fetch(:content, '')
      "<#{tag}#{tag_attributes}>#{content}</#{tag}>\n"
    end

    def self.parsing_attributes(attributes = {})
      return '' if attributes.empty?

      build_attrs = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      [' ', build_attrs].join
    end
  end
end

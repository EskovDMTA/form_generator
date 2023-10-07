# frozen_string_literal: true

require_relative "paired_tags"
# autoload("HexletCode", "lib/hexlet/hexlet-code/hexlet_code")
module HexletCode
  def self.form_for(user, attributes = {})
    attributes[:action] = attributes.delete(:url) if attributes.key?(:url)
    form_attributes = { action: "#", method: "post" }.merge(attributes)
    form_body = block_given? ? yield(FormBodyBuilder.new(user)) : ""
    HexletCode::Tag.build("form", form_attributes, form_body)
  end

  class FormBodyBuilder
    attr_reader :user

    def initialize(user)
      @user = user
      @result = ""
    end

    def input(name, attributes = {})
      @value = user.public_send(name)
      attributes[:value] = @value if @value

      if attributes[:as] == :text
        build_text_input(name, attributes)
      else
        build_default_input(name, attributes)
      end
    end

    def build_text_input(name, attributes)
      text_attributes = { name: name, cols: 20, rows: 40 }.merge(attributes).reject do |k, _v|
        %i[as value].include?(k)
      end

      @result += build_label(name)
      @result += Tag.build("textarea", text_attributes, attributes[:value])
      @result
    end

    def build_default_input(name, attributes)
      input_attributes = { name: name, type: "text", value: @value }.merge(attributes)

      @result += build_label(name)
      @result += Tag.build("input", input_attributes)
      @result
    end

    def build_label(name)
      Tag.build("label", { for: name }, name.to_s.capitalize)
    end

    def submit(value = "Save")
      @result += Tag.build("input", { type: "submit", value: value })
    end
  end

  class Tag
    class << self
      def build(tag_name, attributes = {}, content = "")
        tag_body = yield if block_given?
        content = "\n#{content}" if tag_name == "form"
        "<#{tag_name}#{parsing_attributes(attributes)}>#{tag_body || content || ""}#{paired_tag?(tag_name)}\n"
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

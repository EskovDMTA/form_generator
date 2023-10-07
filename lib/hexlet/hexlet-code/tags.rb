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
      value = user.public_send(name)
      attributes[:value] = value if value

      if attributes[:as] == :text
        text_attributes = { name: name, cols: 20, rows: 40 }.merge(attributes).reject do |k, _v|
          %i[as value].include?(k)
        end
        @result += Tag.build("label", { for: name }, name.to_s.capitalize)
        @result += Tag.build("textarea", text_attributes, attributes[:value])
      else
        input_attributes = { name: name, type: "text", value: value }.merge(attributes)
        @result += Tag.build("label", { for: name }, name.to_s.capitalize)
        @result += Tag.build("input", input_attributes)
      end
      @result
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

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: "rob", job: "developer", gender: "Male"
form = HexletCode.form_for user do |f|
  f.input :name, class: "hexlet"
  f.input :job, as: :text
  f.submit
  f.submit "WOW"
end
print form
